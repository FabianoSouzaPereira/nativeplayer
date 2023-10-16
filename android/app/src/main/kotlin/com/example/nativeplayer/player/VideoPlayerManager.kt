package com.example.nativeplayer.player

import android.content.Intent
import android.net.Uri
import android.app.Activity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class VideoPlayerManager(private val activity: Activity, private val methodChannel: MethodChannel) {
    
    fun playVideo(videoUrl: String) {
        val videoUrl = Url(videoUrl)
        val intent = Intent(Intent.ACTION_VIEW, videoUrl)
        activity.startActivity(intent)
    }

    fun pauseVideo() {
        // Lógica para pausar o vídeo nativo (se aplicável)
    }

    fun handleMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "playVideo" -> {
                val videoUrl = call.argument<String>("videoUrl")
                if (videoUrl != null) {
                    playVideo(videoUrl)
                }
            }
            "pauseVideo" -> {
                pauseVideo()
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}
