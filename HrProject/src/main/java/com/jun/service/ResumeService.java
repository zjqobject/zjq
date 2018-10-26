package com.jun.service;

import com.jun.model.Resume;

import java.util.List;

public interface ResumeService {
    int addResme(Resume resume);
    List<Resume> getResumeByvid(Resume resume);
    Resume  getResumeByid(Resume resume);
    int deleteResumeByid(Resume resume);
    int updateResumeByid(Resume resume);
}
