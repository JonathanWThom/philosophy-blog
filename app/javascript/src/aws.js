var albumBucketName = 'philosophy-blog';
var bucketRegion = 'us-west-2';
var AWS = require('aws-sdk');
var s3;
const uuidv4 = require('uuid/v4');

document.addEventListener("trix-attachment-add", function(event) {
  var xmlhttp = new XMLHttpRequest();
  var url = "/users";
  var identity_pool_id;

  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        var resp = JSON.parse(this.responseText);
        identity_pool_id = resp["identity_pool_id"];

        AWS.config.update({
          region: bucketRegion,
          credentials: new AWS.CognitoIdentityCredentials({
            IdentityPoolId: identity_pool_id
          })
        });

        s3 = new AWS.S3({
          apiVersion: '2006-03-01',
          params: {Bucket: albumBucketName}
        });

        var attachment;
        attachment = event.attachment;
        if (attachment.file) {
          return addPhoto(attachment);
        }

    }
  };
  xmlhttp.open("GET", url, true);
  xmlhttp.send();
});

function addPhoto(attachment) {
  var file = attachment.file;
  var fileName = file.name;
  var albumPhotosKey = encodeURIComponent("photos") + '/';
  var photoKey = albumPhotosKey + fileName + "-" + uuidv4();

  s3.upload({
    Key: photoKey,
    Body: file,
    ACL: 'public-read'
  }, function(err, data) {
    if (err) {
      return console.log('There was an error uploading your photo: ', err.message);
    } else {
      attachment.setAttributes({
        url: data["Location"],
        href: data["Location"]
      });
    }
  });
}
