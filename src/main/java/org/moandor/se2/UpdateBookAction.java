package org.moandor.se2;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class UpdateBookAction extends ActionSupport {
    private String mTitle;
    private int mAuthor;
    private String mIsbn;
    private String mPublisher;
    private String mPublishDate;
    private BigDecimal mPrice;

    @Override
    public String execute() throws Exception {
        if (!ServletActionContext.getRequest().getMethod().equals("POST")) {
            return ERROR;
        }
        BookBean book = new BookBean();
        book.setTitle(mTitle);
        book.setAuthorId(mAuthor);
        book.setIsbn(mIsbn);
        book.setPublisher(mPublisher);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        book.setPublishDate(new Date(format.parse(mPublishDate).getTime()));
        book.setPrice(mPrice);
        Application.getInstance().getDatabaseManager().updateBook(book);
        return SUCCESS;
    }

    public void setTitle(String title) {
        mTitle = title;
    }

    public void setAuthor(int author) {
        mAuthor = author;
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

    public void setPublishDate(String publishDate) {
        mPublishDate = publishDate;
    }

    public void setPrice(BigDecimal price) {
        mPrice = price;
    }
}
