package com.example.keyboardlayout;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnKeyListener;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {

    private EditText edittext;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.main);

        addKeyListener();
    }

    public void addKeyListener() {

        // get edittext component
        edittext = (EditText) findViewById(R.id.myText);

        // add a keylistener to monitor the keaybord avitvity...
        edittext.setOnKeyListener(new OnKeyListener() {
            public boolean onKey(View v, int keyCode, KeyEvent event) {

                // if the users pressed a button and that button was "0"
                if ((event.getAction() == KeyEvent.ACTION_DOWN) && (keyCode == KeyEvent.KEYCODE_0)) {

                    // display the input text....
                    Toast.makeText(MainActivity.this,edittext.getText(), Toast.LENGTH_LONG).show();
                    return true;

                    // if the users pressed a button and that button was "9"
                } else if ((event.getAction() == KeyEvent.ACTION_DOWN)  && (keyCode == KeyEvent.KEYCODE_9)) {

                    // display message
                    Toast.makeText(MainActivity.this, "Number 9 is pressed!", Toast.LENGTH_LONG).show();
                    return true;
                }

                return false;
            }
        });
    }
}
