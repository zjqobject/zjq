package com.jun.service;

import com.jun.dao.VistorDao;
import com.jun.model.Vistor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VistorServiceImpl implements VistorService {
    @Autowired
    private  VistorDao vistorDao;

    public int addVistor(Vistor vistor) {
        return vistorDao.addVistor(vistor);
    }

    public Vistor getVistor(Vistor vistor) {
        return vistorDao.getVistor(vistor);
    }
}
