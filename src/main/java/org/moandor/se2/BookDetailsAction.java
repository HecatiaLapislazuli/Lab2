package org.moandor.se2;

public class BookDetailsAction extends CsrfTokenAction {
    private String mIsbn;
    private BookBean mBook;
    private AuthorBean mAuthor;

    @Override
    public String execute() throws Exception {
        mBook = Application.getInstance().getDatabaseManager().getBook(mIsbn);
        if (mBook == null) {
            return ERROR;
        }
        mAuthor = Application.getInstance().getDatabaseManager().getAuthor(mBook.getAuthorId());
        return SUCCESS;
    }

    public BookBean getBook() {
        return mBook;
    }

    public AuthorBean getAuthor() {
        return mAuthor;
    }

    public void setIsbn(String isbn) {
        mIsbn = isbn;
    }

    public String getIsbn() {
        return mIsbn;
    }
}
