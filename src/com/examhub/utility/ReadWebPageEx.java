package com.examhub.utility;

import java.util.ArrayList;
import java.util.List;

public class ReadWebPageEx {

    private static final ArrayList<List> listOfJobs = new ArrayList<>();

    public static ArrayList<List> getJobPost() {

        if (listOfJobs.isEmpty()) {

            // Job 1
            ArrayList<String> job1 = new ArrayList<>();
            job1.add("Java Developer");
            job1.add("https://www.linkedin.com/jobs/");
            job1.add("Java Developer at Software Company in Mumbai");
            job1.add("2025");
            listOfJobs.add(job1);

            // Job 2
            ArrayList<String> job2 = new ArrayList<>();
            job2.add("Python Developer");
            job2.add("https://www.linkedin.com/jobs/");
            job2.add("Python Developer at Technology Company in Mumbai");
            job2.add("2025");
            listOfJobs.add(job2);

            // Job 3
            ArrayList<String> job3 = new ArrayList<>();
            job3.add("Software Engineer");
            job3.add("https://www.linkedin.com/jobs/");
            job3.add("Software Engineer at IT Company in Mumbai");
            job3.add("2025");
            listOfJobs.add(job3);

            // Job 4
            ArrayList<String> job4 = new ArrayList<>();
            job4.add("Full Stack Developer");
            job4.add("https://www.linkedin.com/jobs/");
            job4.add("Full Stack Developer at Technology Company in Mumbai");
            job4.add("2025");
            listOfJobs.add(job4);

            // Job 5
            ArrayList<String> job5 = new ArrayList<>();
            job5.add("Backend Developer");
            job5.add("https://www.linkedin.com/jobs/");
            job5.add("Backend Developer at Software Company in Mumbai");
            job5.add("2025");
            listOfJobs.add(job5);
        }

        return listOfJobs;
    }
}