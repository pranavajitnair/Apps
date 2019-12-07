package com.londonappbrewery.quizzler;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {

    // TODO: Declare constants here
    int mIndex=0,mScore=0;
    final int PROGRESS_BAR_INCREMENT=8;


    // TODO: Declare member variables here:
    Button mTrueButton,mFalseButton;

    TextView mQuestionTextView,mScoreTextView;

    ProgressBar mProgressBar;

    // TODO: Uncomment to create question bank
    private TrueFalse[] mQuestionBank = new TrueFalse[] {
            new TrueFalse(R.string.question_1, true),
            new TrueFalse(R.string.question_2, true),
            new TrueFalse(R.string.question_3, true),
            new TrueFalse(R.string.question_4, true),
            new TrueFalse(R.string.question_5, true),
            new TrueFalse(R.string.question_6, false),
            new TrueFalse(R.string.question_7, true),
            new TrueFalse(R.string.question_8, false),
            new TrueFalse(R.string.question_9, true),
            new TrueFalse(R.string.question_10, true),
            new TrueFalse(R.string.question_11, false),
            new TrueFalse(R.string.question_12, false),
            new TrueFalse(R.string.question_13,true)
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if(savedInstanceState!=null){
            mScore=savedInstanceState.getInt("ScoreKey");
            mIndex=savedInstanceState.getInt("IndexKey");
        }
        else{
            mScore=0;
            mIndex=0;
        }

        mTrueButton=(Button) findViewById(R.id.true_button);
        mFalseButton=(Button) findViewById(R.id.false_button);

        mQuestionTextView=(TextView) findViewById(R.id.question_text_view);
        mQuestionTextView.setText(mQuestionBank[mIndex].getmQuestionID());

        mScoreTextView=(TextView) findViewById(R.id.score);
        mScoreTextView.setText("Score"+mScore+"/13");

        mProgressBar=(ProgressBar) findViewById(R.id.progress_bar);

        mTrueButton.setOnClickListener(new View.OnClickListener() {
             @Override
            public void onClick(View v) {
                check(true);
                question();
            }
        });


        mFalseButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v){
                check(false);
                question();
            }
        });
    }


    public void question(){
        mIndex=(1+mIndex)%13;

        if(mIndex==0){
            AlertDialog.Builder alert=new AlertDialog.Builder(this);
            alert.setTitle("Game Over");
            alert.setCancelable(false);
            alert.setMessage("You scored "+mScore+" points!");
            alert.setPositiveButton("Close Application", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    finish();
                }
            });

            mProgressBar.setProgress(0);
            mScore=0;
            alert.show();
        }

         mQuestionTextView.setText(mQuestionBank[mIndex].getmQuestionID());
        mProgressBar.incrementProgressBy(PROGRESS_BAR_INCREMENT);
        mScoreTextView.setText("Score"+mScore+"/13");

    }

    public void check(boolean userAnswer){
        Toast incToast=Toast.makeText(getApplicationContext(),R.string.incorrect_toast,Toast.LENGTH_SHORT);
        Toast corToast=Toast.makeText(getApplicationContext(),R.string.correct_toast,Toast.LENGTH_SHORT);

        if(userAnswer==mQuestionBank[mIndex].ismAnswer()){
            corToast.show();
            mScore+=1;
        }
        else {
            incToast.show();
        }
    }
    @Override
    public void onSaveInstanceState(Bundle outState){
        super.onSaveInstanceState(outState);
        outState.putInt("ScoreKey",mScore);
        outState.putInt("IndexKey",mIndex);
    }
}