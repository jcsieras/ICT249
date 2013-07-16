package com.ict249facebook;

import org.apache.cordova.DroidGap;

import android.os.Bundle;

public class MainActivity extends DroidGap {

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
   // setContentView(R.layout.activity_main);
    super.loadUrl("file:///android_asset/www/index.html");
  }
}