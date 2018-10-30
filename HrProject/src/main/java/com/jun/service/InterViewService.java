package com.jun.service;

import com.jun.model.Interview;

import java.util.List;

public interface InterViewService {
    int addInterView(Interview interview);
    Interview getInterView(Interview interview);
    List<Interview> getInterViewByiv_vid(Interview interview);
    int updateInterViewReceive(Interview interview);
    int updateInterViewinvit(Interview interview);
    List<Interview>  getInterViewALL();
    Interview getInterViewByid(Interview interview);
    int updateInterViewofferid(Interview interview);
    List<Interview>  getInterViewByiv_rid(Interview interview);
}
