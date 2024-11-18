package com.example.flutter_app_one

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import android.widget.Toast
import androidx.localbroadcastmanager.content.LocalBroadcastManager
import com.revesoft.revechatsdk.model.VisitorInfo
import com.revesoft.revechatsdk.service.REVEChatApiService
import com.revesoft.revechatsdk.state.LoginState
import com.revesoft.revechatsdk.ui.activity.ReveChatActivity
import com.revesoft.revechatsdk.utils.ReveChat
import com.revesoft.revechatsdk.webrtc.WebRTCHandler


class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.app/activity"



    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openActivity") {
                openActivity()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        if (!REVEChatApiService.isCallRunning())
            stopService(Intent(this, REVEChatApiService::class.java))
    }

    private fun openActivity() {
//        ReveChat.init("2552651")
        ReveChat.init("6899443")
        var loginState : LoginState = LoginState.LOGGED_OUT
        val visitorInfo: VisitorInfo = VisitorInfo.Builder()
            .name("VisitorName")
            .email("visitorName@gmail.com")
            .phoneNumber("+8801814123456")
            .appLoginState(loginState)
            .build()


        ReveChat.setVisitorInfo(visitorInfo)

        startActivity(Intent(this, ReveChatActivity::class.java))
        startService(Intent(this, REVEChatApiService::class.java))
    }
}


