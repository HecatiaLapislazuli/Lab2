package org.moandor.se2;

import java.math.BigDecimal;
import java.sql.Date;

public class BookBean {
    private String mIsbn;
    private String mTitle;
    private int mAuthorId;
    private String mPublisher;
    private Date mPublishDate;
    private BigDecimal mPrice;

    public String getIsbn() {
        return mIsbn;
    }

    public void setIsbn(String isbn) {
        mIsbn = isbn;
    }

    public String getTitle() {
        return mTitle;
    }

    public void setTitle(String title) {
        mTitle = title;
    }

    public int getAuthorId() {
        return mAuthorId;
    }

    public void setAuthorId(int authorId) {
        mAuthorId = authorId;
    }

    public String getPublisher() {
        return mPublisher;
    }

    public void setPublisher(String publisher) {
        mPublisher = publisher;
    }

    public Date getPublishDate() {
        return mPublishDate;
    }

    public void setPublishDate(Date date) {
        mPublishDate = date;
    }

    public BigDecimal getPrice() {
        return mPrice;
    }

    public void setPrice(BigDecimal price) {
        mPrice = price;
    }
}
