package com.web;

import com.entity.Tag;
import com.service.TagsService;
import com.service.impl.TagsServiceImpl;
import com.utils.DataUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * respond to HTTP requests regarding tags
 */
public class TagServlet extends BasicServlet{

    private TagsService tagsService = new TagsServiceImpl();


    protected void queryTagFromDatabase(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Tag> tagList = tagsService.queryTags();
        HttpSession session = req.getSession();
        session.setAttribute("tagList", tagList);
    }

    protected void addNewTagToDatabase(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newTagName = req.getParameter("newTagName");
        System.out.println("newTagName=" + newTagName);
        Tag tag = new Tag(null, newTagName, new Date());
        int update = tagsService.storeNewTagIntoDatabase(tag);
        System.out.println("update=" + update);

        // update session
        queryTagFromDatabase(req, resp);

        resp.sendRedirect(req.getHeader("Referer"));
    }


    protected void deleteTagById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tagId = DataUtils.parseInt(req.getParameter("tagId"), 0);
        System.out.println("tagId=" + tagId);

        int update = tagsService.removeTagById(tagId);
        System.out.println("update=" + update);

        // update session
        queryTagFromDatabase(req, resp);

        resp.sendRedirect(req.getHeader("Referer"));
    }

}
