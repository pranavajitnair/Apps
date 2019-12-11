package com.example.test2;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;

public class Register extends AppCompatActivity {

    private Button button4;
    private EditText password,email;
    private FirebaseAuth mAuth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        button4=(Button) findViewById(R.id.button4);
        email=(EditText) findViewById(R.id.emailregister);
        password=(EditText) findViewById(R.id.pass);

        mAuth=FirebaseAuth.getInstance();

        button4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String mEmail=email.getText().toString();
                String mPassword=password.getText().toString();

                func(mEmail,mPassword);
            }
        });
    }
    private void func(String mEmail,String mPassword){

        mAuth.createUserWithEmailAndPassword(mEmail,mPassword).addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                Log.d("try","created");

                if(!task.isSuccessful()){
                    Log.d("try","Na...");

                }
                else{
                    Intent intent=new Intent(Register.this,MainActivity.class);
                    startActivity(intent);
                }
            }
        });


    }
}
