describe BooksController, type: :request do
  context "when a user is not authenticated" do
    describe "#index" do
      it "allows users to see books" do
        get books_path
        expect(response.status).to eq(200)
      end
    end

    describe "#show" do
      it "allows users to see an individual book" do
        book = create(:book)
        get book_path(book)
        expect(response.status).to eq(200)
      end
    end

    describe "#new" do
      it "redirects unauthenticated users" do
        get new_book_path
        expect(response.status).to eq(302)
      end
    end

    describe "#create" do
      it "redirects unauthenticated users" do
        post books_path
        expect(response.status).to eq(302)
      end
    end

    describe "#edit" do
      it "redirects unauthenticated users" do
        book = create(:book)
        get edit_book_path(book)
        expect(response.status).to eq(302)
      end
    end

    describe "#update" do
      it "redirects unauthenticated users" do
        book = create(:book)
        patch book_path(book)
        expect(response.status).to eq(302)
      end
    end

    describe "#destroy" do
      it "redirects unauthenticated users" do
        book = create(:book)
        delete book_path(book)
        expect(response.status).to eq(302)
      end
    end
  end

  context "when user is authenticated" do
    before(:each) do
      user = create(:user)
      login_as(user)
    end

    describe "#new" do
      it "succeeds" do
        get new_book_path
        expect(response.status).to eq(200)
      end
    end

    describe "#create" do
      it "creates a new book" do
        attributes = build(:book).attributes
        post books_path, params: { book: attributes }
        expect(Book.count).to eq(1)
      end
    end

    describe "#edit" do
      it "succeeds" do
        book = create(:book)
        get edit_book_path(book)
        expect(response.status).to eq(200)
      end
    end

    describe "#update" do
      it "will update a book" do
        book = create(:book)
        new_title = Faker::Beer.name
        patch book_path(book), params: { book: { title: new_title } }
        book = Book.find_by_id(book.id)
        expect(book.title).to eq(new_title)
      end
    end

    describe "#destroy" do
      it "destroys a book" do
        book = create(:book)
        delete book_path(book)
        expect(Book.count).to eq(0)
      end
    end
  end
end
