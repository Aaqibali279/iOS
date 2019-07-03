//
//  Network.swift
//  DemoProject
//
//  Created by Aquib on 26/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

typealias Success<Element:Decodable> = (_ success:Element) -> ()
typealias ErrorMessage = (_ message:Message) -> ()

import Foundation
import Alamofire

struct Network {
    
    static let instance = Network()
    private init(){}
    
    func request<Element:Decodable>(endPoint: String,method:HTTPMethod, parameters: [String: Any]? = nil,showIndicator: Bool? = true, success: Success<Element>? = nil,message:ErrorMessage? = nil) {
        
        if !NetworkReachabilityManager()!.isReachable {
            message?(.network)
            return
        }
        
        
        
        let header: [String: String] = [:]
        
        let urlString = Apis.BASE_URL + endPoint
        debugPrint("********************************* API Request **************************************")
        debugPrint("Request URL:\(urlString)")
        debugPrint("Request Parameters: \(parameters ?? [: ])")
        debugPrint("Request Headers: \(header)")
        debugPrint("************************************************************************************")
        
        guard let url = URL(string: urlString) else{
            message?(.message)
            return
        }
        if showIndicator! {
            Indicator.instance.show()
        }
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: header).responseData { (dataResponse) in
            DispatchQueue.main.async {
                Indicator.instance.hide()
            }
            if let error = dataResponse.error{
                message?(.custom(error.localizedDescription))
                return
            }
            
            guard let data = dataResponse.data else{
                message?(.message)
                return
            }
            
            debugPrint("***********************************************************************")
            do{
                let json = try JSONSerialization.jsonObject(with: data, options:.allowFragments)
                debugPrint("JSON: ",json)
            }catch{
                debugPrint("ERROR:",error)
            }
            
            do{
                let obj = try JSONDecoder().decode(Element.self, from: data)
                success?(obj)
            }catch{
                message?(.message)
                debugPrint("ERROR:",error)
            }
            debugPrint("***********************************************************************")
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
//    func upload(endPoint:String) {
//        if !NetworkReachabilityManager()!.isReachable {
//
//            return
//        }
//
//
//        let parameters = ["user":"Sol", "password":"secret1234"]
//
//        guard let imageToUploadURL = Bundle.main.url(forResource: "tree", withExtension: "png") else{
//            return
//        }
//
//        let url = "http://localhost:8888/upload_image.php"
//
//        Alamofire.upload(multipartFormData: { (multipartData) in
//            multipartData.append(imageToUploadURL, withName: "name")
//        }, to: url) { (result) in
//            switch result{
//            case .success(let upload,_,_):
//                upload.responseData(completionHandler: { (dataResponse) in
//                    if let error = dataResponse.error{
//                        print(error)
//                        return
//                    }
//
//                    guard let data = dataResponse.data else{
//                        print("Error")
//                        return
//                    }
//                    print("DATA",data)
//                })
//                upload.uploadProgress(closure: { (progress) in
//                    print(progress.fractionCompleted,progress.totalUnitCount)
//                })
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    
    
    
    
    
//    func uploadMediaToServer(api: String, imgMedia: [String: Data]? = nil, videoMedia: [String: Data]? = nil,
//                             audioMedia: [String: Data]? = nil,
//                             parameters: [String: AnyObject]? = nil,
//                             showIndicator: Bool? = true) {
//        if !NetworkReachabilityManager()!.isReachable {
//            return
//        }
//
//        if showIndicator! {
//            Indicator.instance.show()
//        }
//
//        var header: [String: String] = [:]
//
//        let apiString = Apis.BASE_URL + api
//        print(apiString)
//        debugPrint("********************************* API Request **************************************")
//        debugPrint("Request URL:\(apiString)")
//        debugPrint("Request Parameters: \(parameters ?? [: ])")
//        debugPrint("Request Headers: \(header)")
//        debugPrint("************************************************************************************")
//        var url = try! URLRequest.init(url: apiString, method: .post, headers: header)
//        url.timeoutInterval = 180
//
//
//        Alamofire.upload(multipartFormData: { (formdata) in
//            if let params = parameters {
//                for (key, value) in params {
//                    formdata.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                }
//            }
//            if let images = imgMedia {
//                for (key,value) in images {
//                    let interval = NSDate().timeIntervalSince1970 * 1000
//                    let imgMimeType : String = "image/jpeg"
//                    let imgFileName = "img\(interval).jpeg"
//                    formdata.append(value, withName: key, fileName: imgFileName, mimeType: imgMimeType)
//                }
//            }
//            if let audios = audioMedia {
//                for (key,value) in audios {
//                    let interval = NSDate().timeIntervalSince1970 * 1000
//                    let audioMimeType = "audio/mpeg"
//                    let audioFileName = "audio\(interval).mp3"
//                    formdata.append(value, withName: key, fileName: audioFileName, mimeType: audioMimeType)
//                }
//            }
//            if let videos = videoMedia {
//                for (key,value) in videos {
//                    let interval = NSDate().timeIntervalSince1970 * 1000
//                    let videoMimeType = "video/mp4"
//                    let videoFileName = "vid\(interval).mp4"
//                    formdata.append(value, withName: key, fileName: videoFileName, mimeType: videoMimeType)
//                }
//            }
//        }, with: url) { (encodingResult) in
//            switch encodingResult {
//            case .success(let upload,_,_):
//                upload.responseJSON(completionHandler: { (response) in
//                    Indicator.instance.hide()
//                    switch response.result {
//                    case .success(_):
//                        print(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) ?? "")
//                        if let data = response.result.value as? NSDictionary {
////                            responseClosure(data, nil,response.data)
//
//                        }
//                    case .failure(let error):
//                        print(error)
//                        //                    switch ApiEndPoints.self {
//                        //                    case .getNewMessages:
//                        //                        break
//                        //                    default:
//
//                        // }
//                    }
//                })
//            case .failure(let error):
//                break
//            }
//        }
//    }


    
}

