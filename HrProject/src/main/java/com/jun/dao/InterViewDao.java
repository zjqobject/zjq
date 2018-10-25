package com.jun.dao;

import com.jun.model.Interview;

import java.util.List;

public interface InterViewDao {
    int addInterView(Interview interview);
    Interview getInterView(Interview interview);
    List<Interview> getInterViewByiv_vname(Interview interview);
     int updateInterViewReceive(Interview interview);
    int updateInterViewinvit(Interview interview);
    List<Interview>  getInterViewALL();
}
