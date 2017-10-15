package org.moandor.se2;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;

public class AddOrUpdateBookViewAction extends CsrfTokenAction {
    private List<AuthorBean> mAuthors;
    private String mTitle;
    private int mAuthor;
    private String mIsbn;
    private String mPublisher;
    private String mPublishDate;
    private BigDecimal mPrice;

    @Override
    public String execute() throws Exception {
        mAuthors = Application.getInstance().getDatabaseManager().getAuthors();
        mAuthors.sort(Comparator.comparing(AuthorBean::getName));
        return SUCCESS;
    }

    public List<AuthorBean> getAuthors() {
        return mAuthors;
    }

    public void setTitle(String title) {
        mTitle = title;
    }

    public String getTitle() {
        return mTitle;
    }

    public void setAuthor(int author) {
        mAuthor = author;
    }

    public int getAuthor() {
        return mAuthor;
    }

    public void setIsbn(String isbn) {
        mIsbn = isbn;
    }

    public String getIsbn() {
        return mIsbn;
    }

    public void setPublisher(String publisher) {
        mPublisher = publisher;
    }

    public String getPublisher() {
        return mPublisher;
    }

    public void setPublishDate(String publishDate) {
        mPublishDate = publishDate;
    }

    public String getPublishDate() {
        return mPublishDate;
    }

    public void setPrice(BigDecimal price) {
        mPrice = price;
    }

    public BigDecimal getPrice() {
        return mPrice;
    }
}
