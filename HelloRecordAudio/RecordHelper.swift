//
//  RecordHelper.swift
//  HelloRecordAudio
//
//  Created by Sophia Wang on 2021/3/26.
//

import Foundation
import AVFoundation

class RecordHelper: NSObject, AVAudioRecorderDelegate{
    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    var isRecording = false   //一開始沒有錄音
    
    func settingAudioSession(toMode mode: AudioSessionMode){    //音訊工作階段模式
        
        audioPlayer?.stop()
        
        let session = AVAudioSession.sharedInstance()
        do{
            switch mode {
            case .record:
                try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            case .play:
                try session.setCategory(AVAudioSessionCategoryPlayBack)
            }
            try session.setActive(false)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag == true{
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: recorder.url)
            }catch{
                print(error.localizedDescription)
            }
    }
        
    func recordAudio() {
            settingAudioSession(toMode: .record)
            audioRecorder?.prepareToRecord()
            audioRecorder?.record()
            isRecording = true
        }
    func stopRecording() {
            if audioRecorder != nil{
                audioRecorder?.stop()
                isRecording = false
                settingAudioSession(toMode: .play)
            }
        }
    func playRecordedSound() {
            if isRecording == false{
                audioPlayer?.stop()
                audioPlayer?.currentTime = 0.0
                audioPlayer?.play()
            }
        }
    func stopPlaying() {
            if isRecording == false{
                audioPlayer?.stop()
                audioPlayer?.currentTime = 0.0
            }
        }
        
    
    override init() {
        super.init()
        //init an audio recorder 先產生出audio recorder
        let fileName = "User.wav"    //確認存檔檔名
        let path = NSHomeDirectory() + "/Documents/" + fileName   //找到存檔路徑
        let url = URL(fileURLWithPath: path)   //確認存檔位置
        
        let recordSettings: [String: Any] = [
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
            AVEncoderBitRateKey: 16,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ]
        do{
            audioRecorder = try AVAudioRecorder(url: url, settings: recordSettings)
            audioRecorder?.delegate = self
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
