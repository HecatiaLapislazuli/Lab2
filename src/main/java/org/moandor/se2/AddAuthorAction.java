package org.moandor.se2;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

public class AddAuthorAction extends ActionSupport {
    private String mName;
    private int mAge;
    private String mCountry;
    private int mId;

    @Override
    public String execute() throws Exception {
        if (!ServletActionContext.getRequest().getMethod().equals("POST")) {
            return ERROR;
        }
        AuthorBean author = new AuthorBean();
        author.setName(mName);
        author.setAge(mAge);
        author.setCountry(mCountry);
        mId = Application.getInstance().getDatabaseManager().insertAuthor(author);
        return SUCCESS;
    }

    public void setName(String name) {
        mName = name;
    }

    public String getName() {
        return mName;
    }

    public void setAge(int age) {
        mAge = age;
    }

    public void setCountry(String country) {
        mCountry = country;
    }

    public int getId() {
        return mId;
    }
}
