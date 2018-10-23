package com.jun.service;

import com.jun.dao.ResumeDao;
import com.jun.model.Resume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumeServiceImpl implements  ResumeService{
    @Autowired
    private ResumeDao resumeDao;
    public int addResme(Resume resume) {
        return resumeDao.addResme(resume);
    }

    public Resume getResume(Resume resume) {
        return  resumeDao.getResume(resume);
    }
}
