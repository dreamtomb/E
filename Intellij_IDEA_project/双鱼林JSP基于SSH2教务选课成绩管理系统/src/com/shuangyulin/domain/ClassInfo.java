package com.shuangyulin.domain;

public class ClassInfo {
    /*班级编号*/
    private String classNumber;
    public String getClassNumber() {
        return classNumber;
    }
    public void setClassNumber(String classNumber) {
        this.classNumber = classNumber;
    }

    /*班级名称*/
    private String className;
    public String getClassName() {
        return className;
    }
    public void setClassName(String className) {
        this.className = className;
    }

    /*所属专业*/
    private SpecialFieldInfo classSpecialFieldNumber;
    public SpecialFieldInfo getClassSpecialFieldNumber() {
        return classSpecialFieldNumber;
    }
    public void setClassSpecialFieldNumber(SpecialFieldInfo classSpecialFieldNumber) {
        this.classSpecialFieldNumber = classSpecialFieldNumber;
    }

    /*成立日期*/
    private String classBirthDate;
    public String getClassBirthDate() {
        return classBirthDate;
    }
    public void setClassBirthDate(String classBirthDate) {
        this.classBirthDate = classBirthDate;
    }

    /*班主任*/
    private String classTeacherCharge;
    public String getClassTeacherCharge() {
        return classTeacherCharge;
    }
    public void setClassTeacherCharge(String classTeacherCharge) {
        this.classTeacherCharge = classTeacherCharge;
    }

    /*联系电话*/
    private String classTelephone;
    public String getClassTelephone() {
        return classTelephone;
    }
    public void setClassTelephone(String classTelephone) {
        this.classTelephone = classTelephone;
    }

    /*附加信息*/
    private String classMemo;
    public String getClassMemo() {
        return classMemo;
    }
    public void setClassMemo(String classMemo) {
        this.classMemo = classMemo;
    }

}