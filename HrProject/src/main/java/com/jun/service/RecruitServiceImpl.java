package com.jun.service;

import com.jun.dao.RecruitDao;
import com.jun.model.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
@Service
public class RecruitServiceImpl  implements RecruitService{
    @Autowired
    private RecruitDao recruitDao;
    public int addRecruit(Recruit recruit) {
        return recruitDao.addRecruit(recruit);
    }

    public List<Recruit> getRecruitListAll(HashMap<String, Object> map) {
        return recruitDao.getRecruitListAll(map);
    }

    public List<Recruit> getRecruitAll() {
        return recruitDao.getRecruitAll();
    }

    public Recruit getRecruitByre_id(Recruit recruit) {
        return recruitDao.getRecruitByre_id(recruit);
    }
}
