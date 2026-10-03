package com.examhub.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.examhub.dao.CategoryDao;
import com.examhub.dao.ExamDao;
import com.examhub.dao.QuestionDao;
import com.examhub.dao.ResultDao;
import com.examhub.dao.SectionDao;
import com.examhub.dao.StudentDao;
import com.examhub.dao.TestDao;

import com.examhub.impl.CategoryDaoImpl;
import com.examhub.impl.ExamDaoImpl;
import com.examhub.impl.QuestionDaoImpl;
import com.examhub.impl.ResultDaoImpl;
import com.examhub.impl.SectionDaoImpl;
import com.examhub.impl.StudentDaoImpl;
import com.examhub.impl.TestDaoImpl;

import com.examhub.pojo.Category;
import com.examhub.pojo.Exam;
import com.examhub.pojo.Question;
import com.examhub.pojo.Result;
import com.examhub.pojo.Section;
import com.examhub.pojo.Student;
import com.examhub.pojo.Test;

@WebServlet("/reportServlet")
public class ReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CategoryDao categoryDao = new CategoryDaoImpl();
    private SectionDao sectionDao = new SectionDaoImpl();
    private ExamDao examDao = new ExamDaoImpl();
    private TestDao testDao = new TestDaoImpl();
    private QuestionDao questionDao = new QuestionDaoImpl();
    private ResultDao resultDao = new ResultDaoImpl();
    private StudentDao studentDao = new StudentDaoImpl();

    public ReportServlet() {
        super();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String operation = request.getParameter("reportName");

        if (operation == null || operation.trim().isEmpty()) {
            response.sendRedirect(
                    request.getContextPath() + "/report.jsp");
            return;
        }

        // =====================================================
        // CATEGORY REPORT
        // =====================================================

        if (operation.equalsIgnoreCase("Category")) {

            List<Category> listOfCategory =
                    categoryDao.viewAllCategories();

            request.setAttribute(
                    "listOfCategory",
                    listOfCategory);

            request.getRequestDispatcher(
                    "categoryReport.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // SECTION REPORT
        // =====================================================

        else if (operation.equalsIgnoreCase("Section")) {

            String examId = request.getParameter("examId");

            List<Section> listOfSection;

            if (examId == null || examId.trim().isEmpty()) {
                listOfSection =
                        sectionDao.viewAllSection();
            } else {
                listOfSection =
                        sectionDao.viewAllSection(
                                Integer.parseInt(examId));
            }

            request.setAttribute(
                    "listOfSection",
                    listOfSection);

            request.getRequestDispatcher(
                    "sectionReport.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // QUESTION REPORT
        // =====================================================

        else if (operation.equalsIgnoreCase("question")) {

            String examId = request.getParameter("examId");

            List<Question> listOfQuestion;

            if (examId == null || examId.trim().isEmpty()) {
                listOfQuestion =
                        questionDao.viewAllQuestion();
            } else {
                listOfQuestion =
                        questionDao.viewAllQuestion(
                                Integer.parseInt(examId));
            }

            request.setAttribute(
                    "listOfQuestion",
                    listOfQuestion);

            request.getRequestDispatcher(
                    "questionReport.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // TEST REPORT
        // =====================================================

        else if (operation.equalsIgnoreCase("test")) {

            String examId =
                    request.getParameter("examId");

            String type =
                    request.getParameter("type");

            List<Test> listOfTest =
                    new ArrayList<Test>();

            if (examId == null || examId.trim().isEmpty()) {
                examId = "all";
            }

            if (type == null || type.trim().isEmpty()) {
                type = "all";
            }

            if (examId.equalsIgnoreCase("all")) {

                if (type.equalsIgnoreCase("all")) {

                    listOfTest =
                            testDao.viewAllTest();

                } else if (type.equalsIgnoreCase("mock")) {

                    listOfTest =
                            testDao.viewAllTest("mock");

                } else if (type.equalsIgnoreCase("practice")
                        || type.equalsIgnoreCase("practice test")) {

                    listOfTest =
                            testDao.viewAllTest("Practice Test");
                }

            } else {

                int selectedExamId =
                        Integer.parseInt(examId);

                if (type.equalsIgnoreCase("all")) {

                    listOfTest =
                            testDao.viewAllTest(
                                    selectedExamId);

                } else if (type.equalsIgnoreCase("mock")) {

                    listOfTest =
                            testDao.viewAllTest(
                                    "mock",
                                    selectedExamId);

                } else if (type.equalsIgnoreCase("practice")
                        || type.equalsIgnoreCase("practice test")) {

                    listOfTest =
                            testDao.viewAllTest(
                                    "Practice Test",
                                    selectedExamId);
                }
            }

            request.setAttribute(
                    "listOftest",
                    listOfTest);

            request.getRequestDispatcher(
                    "testReport.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // UPCOMING TEST REPORT
        // =====================================================

        else if (operation.equalsIgnoreCase("upcomingTest")) {

            List<Test> listOfTest =
                    testDao.viewAllUpcomingTest();

            request.setAttribute(
                    "listOftest",
                    listOfTest);

            request.getRequestDispatcher(
                    "testReport.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // EXAM REPORT
        // =====================================================

        else if (operation.equalsIgnoreCase("exam")) {

            List<Exam> listOfExam =
                    examDao.viewAllExam();

            request.setAttribute(
                    "listOfexam",
                    listOfExam);

            request.getRequestDispatcher(
                    "examReport.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // STUDENT REPORT
        // =====================================================

        else if (operation.equalsIgnoreCase("student")) {

            List<Student> listOfStudent =
                    studentDao.viewAllStudent();

            request.setAttribute(
                    "listOfstudent",
                    listOfStudent);

            request.getRequestDispatcher(
                    "studentReport.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // RESULT REPORT
        // =====================================================

        else if (operation.equalsIgnoreCase("result")) {

            List<List> resultReportList =
                    new ArrayList<List>();

            List<Test> listOfTest =
                    testDao.viewAllTest();

            for (Test test : listOfTest) {

                int testId =
                        test.getTestId();

                List<Result> listOfResults =
                        resultDao.viewAllResults(testId);

                int totalStudentAppearTest =
                        listOfResults.size();

                int classA = 0;
                int classB = 0;
                int classC = 0;
                int classD = 0;

                int certificateCount = 0;

                // ---------------------------------------------
                // CALCULATE PERFORMANCE
                // ---------------------------------------------

                for (Result result : listOfResults) {

                    char grade =
                            ResultServlet.checkGrade(
                                    result.getObtained(),
                                    result.getMaxMarks());

                    if (grade == 'A') {
                        classA++;
                    } else if (grade == 'B') {
                        classB++;
                    } else if (grade == 'C') {
                        classC++;
                    } else {
                        classD++;
                    }

                    // -----------------------------------------
                    // CERTIFICATE COUNT
                    // view != -1 means certificate approved
                    // -----------------------------------------

                    if (result.getView() != -1) {
                        certificateCount++;
                    }
                }

                Exam exam =
                        examDao.viewExam(
                                test.getExamId());

                String examName = "";

                if (exam != null) {
                    examName =
                            exam.getExamName();
                }

                // ---------------------------------------------
                // RESULT REPORT RECORD
                //
                // 0 = Test ID
                // 1 = Test Name + Exam Name
                // 2 = Test Type
                // 3 = Open Date
                // 4 = Close Date
                // 5 = Max Marks
                // 6 = Total Attempt
                // 7 = Passed Count
                // 8 = Failed Count
                // 9 = Certificate Count
                // ---------------------------------------------

                List resultReportRecord =
                        new ArrayList();

                resultReportRecord.add(
                        testId);

                resultReportRecord.add(
                        test.getTestName()
                                + " - "
                                + examName);

                resultReportRecord.add(
                        test.getTestType());

                resultReportRecord.add(
                        test.getOpen());

                resultReportRecord.add(
                        test.getclose());

                resultReportRecord.add(
                        test.getMaxMarks());

                resultReportRecord.add(
                        totalStudentAppearTest);

                resultReportRecord.add(
                        classA + classB);

                resultReportRecord.add(
                        classC + classD);

                // IMPORTANT:
                // This is now actual Certificate Count.
                resultReportRecord.add(
                        certificateCount);

                resultReportList.add(
                        resultReportRecord);
            }

            request.setAttribute(
                    "resultReportList",
                    resultReportList);

            request.getRequestDispatcher(
                    "resultReport.jsp")
                    .forward(request, response);

            return;
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}