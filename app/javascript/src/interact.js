const interact = require('interactjs');

interact('.attachment--preview img')
  .resizable({
    edges: {  right: true, bottom: true},

    restrictEdges: {
      outer: 'trix-editor'
    },

    restrictSize: {
      min: { width: 100, height: 50 },
    },
  })
  .on('resizemove', function (event) {
    console.log(event.target)
    var target = event.target,
        x = (parseFloat(target.getAttribute('data-x')) || 0),
        y = (parseFloat(target.getAttribute('data-y')) || 0);

    target.style.width  = event.rect.width + 'px';
    target.style.height = event.rect.height + 'px';
    var styles = target.style;
    var source = target.src;

    var xmlhttp = new XMLHttpRequest();
    var url = "/images/" + ;

    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        console.log('worked')
      }
    };
    xmlhttp.open("PUT", url, true);
    xmlhttp.send();

    x += event.deltaRect.left;
    y += event.deltaRect.top;

    target.style.webkitTransform = target.style.transform =
        'translate(' + x + 'px,' + y + 'px)';

    target.setAttribute('data-x', x);
    target.setAttribute('data-y', y);
    target.textContent = Math.round(event.rect.width) + '\u00D7' + Math.round(event.rect.height);
  });
