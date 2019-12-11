package com.example.test2;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class Chat extends AppCompatActivity {

    private EditText mText;
    private TextView mView;
    private Button button;
    private DatabaseReference mDatabaseReference;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mText=(EditText) findViewById(R.id.edit);
        mView=(TextView) findViewById(R.id.text);
        button=(Button) findViewById(R.id.button);
        mDatabaseReference= FirebaseDatabase.getInstance().getReference();

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String message=mText.getText().toString();
                func(message);
            }
        });

    }
    private void func(final String message){
        String user=FirebaseAuth.getInstance().getCurrentUser().getEmail();
        Mass mMessage=new Mass(user,message);
        mDatabaseReference.child("mm").push().setValue(mMessage).addOnCompleteListener(this, new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {

                if(!task.isSuccessful()){
                    Log.d("try","no message sent");
                }
                else{
                    mView.setText(message);
                }

            }
        });

    }
}
