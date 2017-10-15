package org.moandor.se2;

import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ApiAllAuthorsAction extends ActionSupport {
    private List<AuthorBean> mAuthors;

    @Override
    public String execute() throws Exception {
        mAuthors = Application.getInstance().getDatabaseManager().getAuthors();
        return SUCCESS;
    }

    public List<AuthorBean> getAuthors() {
        return mAuthors;
    }
}
