package com.example.test2;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;


public class MainActivity extends AppCompatActivity {

    private Button button2,button3;
    private EditText email,password;
    private FirebaseAuth mAuth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        button2=(Button) findViewById(R.id.button2);
        button3=(Button) findViewById(R.id.button3);
        email=(EditText) findViewById(R.id.email);
        password=(EditText) findViewById(R.id.password);

        mAuth=FirebaseAuth.getInstance();

        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent=new Intent(MainActivity.this,Register.class);
                startActivity(intent);
            }
        });

        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String mEmail=email.getText().toString();
                String mPassword=password.getText().toString();
                func(mEmail,mPassword);
            }
        });
    }

    private void func(String mEmail,String mPassword){

        mAuth.signInWithEmailAndPassword(mEmail,mPassword).addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                Log.d("FlashChat","createUser onComplete: "+task.isSuccessful());

                if(!task.isSuccessful()){
                    Log.d("try","NNNNAAAA....");
                }
                else{
                    Intent intent=new Intent(MainActivity.this, Chat.class);
                    startActivity(intent);
                }
            }
        });


    }
}