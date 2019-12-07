package com.example.test;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import cz.msebera.android.httpclient.Header;

public class MainActivity extends AppCompatActivity {

    private Button button;
    private EditText text;
    private TextView view;

    private String url="https://api.darksky.net/forecast/d214c28dd7bc8234bfc0e3d54a1f377c/";
    private String mUrl="https://api.mapbox.com/geocoding/v5/mapbox.places/";
    private String mUrl_s=".json?access_token=pk.eyJ1IjoicHJhbmF2bjEwIiwiYSI6ImNrM3ZqNXppYTA3NWYzbm9vM2VnMGQ5b24ifQ.GBBHhPNikb-uO8boLyGfeQ";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button=(Button) findViewById(R.id.button);
        view=(TextView) findViewById(R.id.one);
        text=(EditText) findViewById(R.id.val);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String value=text.getText().toString();
                func_2(value);
            }
        });
    }

    protected void func_2(String value){
        AsyncHttpClient client = new AsyncHttpClient();
        String URL=mUrl+value+mUrl_s;

        client.get(URL,new JsonHttpResponseHandler(){

            @Override
            public void onSuccess(int StatusCode, Header[] headers, JSONObject response){

                try{
                            JSONArray jd=response.getJSONArray("features");
                            JSONObject id2=jd.getJSONObject(0);
                            JSONArray id3=id2.getJSONArray("center");
                            String second=id3.toString();
                            double [] arr=func3(second);
                            func(arr);
                        } catch (JSONException e){
                        }
            }

            @Override
            public void onFailure(int StatusCode,Header[] headers,Throwable e,JSONObject response){
                Log.d("try",e.toString());
            }

        });
    }

    protected double [] func3(String s){

        String[] items = s.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\\s", "").split(",");
        double [] results = new double[items.length];

        for (int i = 0; i < items.length; i++) {
            try {
                results[i] = Double.parseDouble(items[i]);
            } catch (NumberFormatException nfe) {
            }
        }

        return results;
    }

    protected void func(double[] arr) {

        AsyncHttpClient client = new AsyncHttpClient();
        String urlPrime=url+arr[1]+','+arr[0];
        client.get(urlPrime,new JsonHttpResponseHandler(){

            @Override
            public void onSuccess(int StatusCode, Header[] headers, JSONObject response){

                try {

                    JSONObject obj = response.getJSONObject("currently");
                    String summary=obj.getString("summary");
                    String icon=obj.getString("icon");
                    String temp=obj.getString("temperature");

                    String ans="Today's temperature is "+temp+" Throughout the day we would have "+summary+" weather. icon being a "+icon;
                    view.setText(ans);

                } catch (JSONException e){

                }
           }

           @Override
            public void onFailure(int StatusCode,Header[] headers,Throwable e,JSONObject response){
                Log.d("try",e.toString());
           }

        });
   }


}
