package com.jun.service;

import com.jun.dao.ResumeDao;
import com.jun.model.Resume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResumeServiceImpl implements  ResumeService{
    @Autowired
    private ResumeDao resumeDao;
    public int addResme(Resume resume) {
        return resumeDao.addResme(resume);
    }

    public List<Resume> getResumeByvid(Resume resume) {
        return resumeDao.getResumeByvid(resume);
    }

    public Resume getResumeByid(Resume resume) {
        return resumeDao.getResumeByid(resume);
    }


}
