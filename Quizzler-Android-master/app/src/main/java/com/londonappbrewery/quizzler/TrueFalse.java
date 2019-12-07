package com.londonappbrewery.quizzler;

public class TrueFalse {
    private int mQuestionID;
    private boolean mAnswer;

    public int getmQuestionID() {
        return mQuestionID;
    }

    public void setmQuestionID(int mQuestionID) {
        this.mQuestionID = mQuestionID;
    }

    public boolean ismAnswer() {
        return mAnswer;
    }

    public void setmAnswer(boolean mAnswer) {
        this.mAnswer = mAnswer;
    }

    public TrueFalse(int questionResourceTD, boolean trueOrFalse){
        mQuestionID=questionResourceTD;
        mAnswer=trueOrFalse;
    }

}
