//
//  ViewController.swift
//  HelloRecordAudio
//
//  Created by Sophia Wang on 2021/3/26.
//

import UIKit
import AVFoundation

enum AudioSessionMode{
    case record
    case play
}

class ViewController: UIViewController, AVAudioRecorderDelegate {
    
    var recordHelper: RecordHelper?

    @IBAction func recordAudio(_ sender: UIButton) {
        recordHelper?.recordAudio()
    }
    @IBAction func stopRecording(_ sender: UIButton) {
        recordHelper.stopRecording()
        }
    }
    @IBAction func playRecordedSound(_ sender: UIButton) {
        recordHelper.playRecordedSound()
        }
    }
    @IBAction func stopPlaying(_ sender: UIButton) {
        recordHelper.stopPlaying()
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        recordHelper = RecordHelper()
        
    }


}

