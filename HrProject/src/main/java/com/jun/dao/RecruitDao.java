package com.jun.dao;

import com.jun.model.Recruit;

import java.util.HashMap;
import java.util.List;

public interface RecruitDao {
    int addRecruit(Recruit recruit);
    List<Recruit> getRecruitListAll(HashMap<String ,Object> map);
    List<Recruit> getRecruitAll();
    Recruit getRecruitByre_id(Recruit recruit);
}
