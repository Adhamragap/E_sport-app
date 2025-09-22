//
//  NetworkManager.swift
//  DIVANO
//
//  Created by eslam awad elsayed awad on 6/17/23.
//

import SystemConfiguration

public class NetworkManager {
    static let shared = NetworkManager() /// Singleton instance
    private var connectionBackClosure: (() -> ())?
    var isReachable: Bool = false /// Flag to track internet connectivity
    
    private init() {
        startMonitoring()
    }
    
    func startMonitoring() {
        let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")
        var context = SCNetworkReachabilityContext()
        context.info = UnsafeMutableRawPointer(Unmanaged<NetworkManager>.passUnretained(self).toOpaque())
        
        if SCNetworkReachabilitySetCallback(reachability!, { (reachability, flags, info) in
            if let info = info {
                let manager = Unmanaged<NetworkManager>.fromOpaque(info).takeUnretainedValue()
                manager.networkStatusChanged(flags: flags)
            }
        }, &context) {
            SCNetworkReachabilitySetDispatchQueue(reachability!, DispatchQueue.main)
        }
    }
    
    private func networkStatusChanged(flags: SCNetworkReachabilityFlags) {
        let isReachable = flags.contains(.reachable)
        let wasReachable = self.isReachable
        self.isReachable = isReachable
        if !wasReachable && isReachable {
            connectionBackClosure?()
                
        }
    }
    
    func setConnectionBackClosure(_ closure: (() -> ())?) {
        connectionBackClosure = closure
    }
}
