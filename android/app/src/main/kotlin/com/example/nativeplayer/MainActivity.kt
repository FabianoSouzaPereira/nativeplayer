package com.example.nativeplayer

import android.content.Intent
import android.net.Uri
import com.example.nativeplayer.models.Camera
import com.example.nativeplayer.player.VideoPlayerManager
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "player"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
        val videoPlayerManager = VideoPlayerManager(this, methodChannel)
    }
}
