package com.jun.dao;

import com.jun.model.Resume;

import java.util.List;

public interface ResumeDao {
    int addResme(Resume resume);
    Resume getResume(Resume resume);
}
