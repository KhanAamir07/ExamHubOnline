package com.examhub.test;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examhub.dao.ExamDao;
import com.examhub.dao.ResultDao;
import com.examhub.dao.StudentDao;
import com.examhub.dao.TestDao;
import com.examhub.impl.ExamDaoImpl;
import com.examhub.impl.ResultDaoImpl;
import com.examhub.impl.StudentDaoImpl;
import com.examhub.impl.TestDaoImpl;
import com.examhub.pojo.Exam;
import com.examhub.pojo.Result;
import com.examhub.pojo.Student;
import com.examhub.pojo.Test;

@WebServlet("/resultServlet")
public class ResultServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final TestDao testDao = new TestDaoImpl();
    private final ExamDao examDao = new ExamDaoImpl();
    private final ResultDao resultDao = new ResultDaoImpl();
    private final StudentDao studentDao = new StudentDaoImpl();

    // =========================================================
    // GRADE
    // =========================================================

    public static char checkGrade(int markObtained, int totalMarks) {

        if (totalMarks <= 0) {
            return 'D';
        }

        int percentage = (markObtained * 100) / totalMarks;

        if (percentage <= 40) {
            return 'D';
        } else if (percentage <= 60) {
            return 'C';
        } else if (percentage < 75) {
            return 'B';
        } else {
            return 'A';
        }
    }

    // =========================================================
    // ADMIN SESSION CHECK
    // =========================================================

    private boolean isAdmin(HttpSession session) {

        if (session == null) {
            return false;
        }

        Object adminLogin = session.getAttribute("adminLogin");
        Object admin = session.getAttribute("admin");
        Object adminUsername = session.getAttribute("adminUsername");

        return (adminLogin != null && !adminLogin.toString().trim().isEmpty())
                || (admin != null && !admin.toString().trim().isEmpty())
                || (adminUsername != null && !adminUsername.toString().trim().isEmpty());
    }

    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String operation = request.getParameter("operation");

        HttpSession session = request.getSession(false);

        String studentUsername = null;

        if (session != null) {
            Object student = session.getAttribute("studentLogin");

            if (student != null) {
                studentUsername = student.toString();
            }
        }

        // =====================================================
        // INVALID OPERATION
        // =====================================================

        if (operation == null || operation.trim().isEmpty()) {

            if (studentUsername != null) {
                response.sendRedirect(
                        request.getContextPath() + "/studentHome.jsp");
            } else {
                response.sendRedirect(
                        request.getContextPath() + "/adminLogin.jsp");
            }

            return;
        }

        // =====================================================
        // STUDENT - VIEW RESULT
        // =====================================================

        if (operation.equalsIgnoreCase("viewResult")) {

            if (studentUsername == null) {

                response.sendRedirect(
                        request.getContextPath() + "/studentLogin.jsp");

                return;
            }

            String testIdParameter = request.getParameter("testId");

            if (testIdParameter == null || testIdParameter.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath() + "/studentHome.jsp");

                return;
            }

            int testId;

            try {
                testId = Integer.parseInt(testIdParameter);
            } catch (NumberFormatException e) {

                response.sendRedirect(
                        request.getContextPath() + "/studentHome.jsp");

                return;
            }

            Result resultToView =
                    resultDao.viewResult(testId, studentUsername);

            if (resultToView == null) {

                request.setAttribute(
                        "resultError",
                        "No result found for this test.");

                request.getRequestDispatcher(
                        "studentHome.jsp")
                        .forward(request, response);

                return;
            }

            Test test = testDao.viewTest(testId);

            List<Result> listOfResults =
                    resultDao.viewAllResults(testId);

            // =================================================
            // CLASS DISTRIBUTION
            // =================================================

            int classA = 0;
            int classB = 0;
            int classC = 0;
            int classD = 0;

            for (Result result : listOfResults) {

                char grade = checkGrade(
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
            }

            // =================================================
            // RANK
            // =================================================

            double rank = 1;

            for (int i = 0; i < listOfResults.size(); i++) {

                Result current = listOfResults.get(i);

                if (current.getResultId()
                        == resultToView.getResultId()) {

                    rank = i + 1;
                    break;
                }
            }

            // =================================================
            // TOTAL STUDENTS
            // =================================================

            double totalStudentAppearTest =
                    listOfResults.size();

            // =================================================
            // PERCENTILE
            // =================================================

            double percentile = 0;

            if (totalStudentAppearTest > 0) {

                percentile =
                        ((totalStudentAppearTest - rank)
                                / totalStudentAppearTest)
                                * 100;
            }

            // =================================================
            // GRADE
            // =================================================

            char grade = checkGrade(
                    resultToView.getObtained(),
                    resultToView.getMaxMarks());

            // =================================================
            // PERCENTAGE
            // =================================================

            int percentageObtained = 0;

            if (resultToView.getMaxMarks() > 0) {

                percentageObtained =
                        (resultToView.getObtained() * 100)
                                / resultToView.getMaxMarks();
            }

            // =================================================
            // STATUS
            // =================================================

            String resultStatus =
                    percentageObtained >= 60
                            ? "Passed"
                            : "Failed";

            // =================================================
            // ATTEMPTED
            // =================================================

            int attempted =
                    resultToView.getAttempted();

            // =================================================
            // CORRECT
            // =================================================

            int correct =
                    resultToView.getCorrect();

            // =================================================
            // WRONG
            // =================================================

            int wrong =
                    Math.max(0, attempted - correct);

            // =================================================
            // UNATTEMPTED
            // =================================================

            int unattempted =
                    Math.max(
                            0,
                            resultToView.getMaxQuestions()
                                    - attempted);

            // =================================================
            // ACCURACY
            // =================================================

            double accuracy = 0;

            if (attempted > 0) {

                accuracy =
                        ((double) correct / attempted)
                                * 100;
            }

            // =================================================
            // SEND DATA TO JSP
            // =================================================

            request.setAttribute(
                    "resultToView",
                    resultToView);

            request.setAttribute(
                    "test",
                    test);

            request.setAttribute(
                    "percentage",
                    percentageObtained);

            request.setAttribute(
                    "resultStatus",
                    resultStatus);

            request.setAttribute(
                    "grade",
                    grade);

            request.setAttribute(
                    "rank",
                    rank);

            request.setAttribute(
                    "percentile",
                    percentile);

            request.setAttribute(
                    "totalStudentAppearTest",
                    totalStudentAppearTest);

            request.setAttribute(
                    "classA",
                    classA);

            request.setAttribute(
                    "classB",
                    classB);

            request.setAttribute(
                    "classC",
                    classC);

            request.setAttribute(
                    "classD",
                    classD);

            request.setAttribute(
                    "wrong",
                    wrong);

            request.setAttribute(
                    "unattempted",
                    unattempted);

            request.setAttribute(
                    "accuracy",
                    accuracy);

            request.getRequestDispatcher(
                    "viewResult.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // ADMIN - VIEW ALL RESULTS
        // =====================================================

        if (operation.equalsIgnoreCase("viewAllResult")) {

            // IMPORTANT:
            // Do not create a new session here.
            // Use the existing admin session.

            if (!isAdmin(session)) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/adminLogin.jsp");

                return;
            }

            List<List> resultReportList =
                    new ArrayList<List>();

            List<Test> listOfTest =
                    testDao.viewAllTest();

            for (Test test : listOfTest) {

                int testId =
                        test.getTestId();

                List<Result> listOfResults =
                        resultDao.viewAllResults(testId);

                for (Result result : listOfResults) {

                    char grade =
                            checkGrade(
                                    result.getObtained(),
                                    result.getMaxMarks());

                    String status =
                            (grade == 'A'
                                    || grade == 'B')
                                    ? "Pass"
                                    : "Fail";

                    List resultReportRecord =
                            new ArrayList();

                    Exam exam =
                            examDao.viewExam(
                                    test.getExamId());

                    String examName = "";

                    if (exam != null) {
                        examName =
                                exam.getExamName();
                    }

                    // 0 = Test Name + Exam Name
                    resultReportRecord.add(
                            test.getTestName()
                                    + " "
                                    + examName);

                    // 1 = Test Type
                    resultReportRecord.add(
                            test.getTestType());

                    // 2 = Student Username
                    resultReportRecord.add(
                            result.getStudUsername());

                    // 3 = Maximum Marks
                    resultReportRecord.add(
                            (double) result.getMaxMarks());

                    // 4 = Obtained Marks
                    resultReportRecord.add(
                            (double) result.getObtained());

                    // 5 = Grade
                    resultReportRecord.add(
                            grade);

                    // 6 = Status
                    resultReportRecord.add(
                            status);

                    // 7 = Test ID
                    resultReportRecord.add(
                            test.getTestId());

                    // 8 = Certificate Status
                    resultReportRecord.add(
                            result.getView());

                    resultReportList.add(
                            resultReportRecord);
                }
            }

            request.setAttribute(
                    "resultReportList",
                    resultReportList);

            request.getRequestDispatcher(
                    "viewAllResult.jsp")
                    .forward(request, response);

            return;
        }

        // =====================================================
        // CERTIFICATE
        // ADMIN = SEND CERTIFICATE
        // STUDENT = VIEW CERTIFICATE
        // =====================================================

        if (operation.equalsIgnoreCase("certificate")) {

            // =================================================
            // ADMIN SEND CERTIFICATE
            // =================================================

            if (isAdmin(session)) {

                String username =
                        request.getParameter("username");

                String testIdParameter =
                        request.getParameter("testId");

                if (username == null
                        || username.trim().isEmpty()
                        || testIdParameter == null
                        || testIdParameter.trim().isEmpty()) {

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/resultServlet?operation=viewAllResult");

                    return;
                }

                int testId;

                try {
                    testId =
                            Integer.parseInt(testIdParameter);
                } catch (NumberFormatException e) {

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/resultServlet?operation=viewAllResult");

                    return;
                }

                Result result =
                        resultDao.viewResult(
                                testId,
                                username);

                if (result == null) {

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/resultServlet?operation=viewAllResult");

                    return;
                }

                char grade =
                        checkGrade(
                                result.getObtained(),
                                result.getMaxMarks());

                // Certificate only for Grade A
                if (grade == 'A'
                        && result.getView() == -1) {

                    boolean updated =
                            resultDao.updateResult(
                                    username,
                                    testId,
                                    result.getResultId());

                    if (updated) {

                        response.sendRedirect(
                                request.getContextPath()
                                        + "/resultServlet?operation=viewAllResult");

                        return;
                    }
                }

                response.sendRedirect(
                        request.getContextPath()
                                + "/resultServlet?operation=viewAllResult");

                return;
            }

            // =================================================
            // STUDENT VIEW CERTIFICATE
            // =================================================

            if (studentUsername == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/studentLogin.jsp");

                return;
            }

            String username =
                    request.getParameter("username");

            String testIdParameter =
                    request.getParameter("testId");

            if (username == null
                    || username.trim().isEmpty()
                    || testIdParameter == null
                    || testIdParameter.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/studentHome.jsp");

                return;
            }

            // Student can view only own certificate
            if (!studentUsername.equalsIgnoreCase(username)) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/studentHome.jsp");

                return;
            }

            int testId;

            try {
                testId =
                        Integer.parseInt(testIdParameter);
            } catch (NumberFormatException e) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/studentHome.jsp");

                return;
            }

            Result result =
                    resultDao.viewResult(
                            testId,
                            username);

            if (result == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/studentHome.jsp");

                return;
            }

            // Certificate must be approved/sent by Admin
            if (result.getView() == -1) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/studentHome.jsp");

                return;
            }

            Student student =
                    studentDao.viewProfile(username);

            Test test =
                    testDao.viewTest(testId);

            Exam exam = null;

            if (test != null) {

                exam =
                        examDao.viewExam(
                                test.getExamId());
            }

            // =================================================
            // PERCENTAGE
            // =================================================

            int percentage = 0;

            if (result.getMaxMarks() > 0) {

                percentage =
                        (result.getObtained() * 100)
                                / result.getMaxMarks();
            }

            // =================================================
            // GRADE
            // =================================================

            char grade =
                    checkGrade(
                            result.getObtained(),
                            result.getMaxMarks());

            // =================================================
            // STATUS
            // =================================================

            String status =
                    percentage >= 60
                            ? "Passed"
                            : "Failed";

            // =================================================
            // CERTIFICATE ID
            // =================================================

            String certificateId =
                    String.format(
                            "EP-CERT-%06d",
                            result.getResultId());

            // =================================================
            // ISSUE DATE
            // =================================================

            String issueDate =
                    new SimpleDateFormat(
                            "dd MMMM yyyy")
                            .format(new Date());

            // =================================================
            // SEND DATA TO CERTIFICATE JSP
            // =================================================

            request.setAttribute(
                    "student",
                    student);

            request.setAttribute(
                    "result",
                    result);

            request.setAttribute(
                    "test",
                    test);

            request.setAttribute(
                    "exam",
                    exam);

            request.setAttribute(
                    "percentage",
                    percentage);

            request.setAttribute(
                    "grade",
                    grade);

            request.setAttribute(
                    "status",
                    status);

            request.setAttribute(
                    "certificateId",
                    certificateId);

            request.setAttribute(
                    "issueDate",
                    issueDate);

            request.getRequestDispatcher(
                    "certificate.jsp")
                    .forward(request, response);

            return;
        }
    }

    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}