package com.jun.service;

import com.jun.dao.InterViewDao;
import com.jun.model.Interview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InterViewServiceImpl implements InterViewService{
    @Autowired
    private InterViewDao  interViewDao;

    public int addInterView(Interview interview) {
        return interViewDao.addInterView(interview);
    }

    public Interview getInterView(Interview interview) {
        return interViewDao.getInterView(interview);
    }

    public List<Interview> getInterViewByiv_vname(Interview interview) {
        return interViewDao.getInterViewByiv_vname(interview);
    }


}
