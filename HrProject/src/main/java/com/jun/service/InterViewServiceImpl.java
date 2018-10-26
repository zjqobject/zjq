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

    public int updateInterViewReceive(Interview interview) {
        return interViewDao.updateInterViewReceive(interview);
    }

    public int updateInterViewinvit(Interview interview) {
        return interViewDao.updateInterViewinvit(interview);
    }

    public List<Interview> getInterViewALL() {
        return interViewDao.getInterViewALL();
    }

    public Interview getInterViewByid(Interview interview) {
        return  interViewDao.getInterViewByid(interview);
    }

    public int updateInterViewofferid(Interview interview) {
        return interViewDao.updateInterViewofferid(interview);
    }

    public List<Interview> getInterViewByiv_rid(Interview interview) {
        return interViewDao.getInterViewByiv_rid(interview);
    }


}
