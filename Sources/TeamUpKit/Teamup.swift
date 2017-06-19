//
//  Teamup.swift
//  TeamupKit
//
//  Created by Merrick Sapsford on 10/06/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import Foundation

public class Teamup {
    
    // MARK: Properties
    
    private let config: Config
    private var requestBuilder: RequestBuilder!
    private var requestExecutor: RequestExecutor!
    
    public var auth: Authentication!
    public var sessions: Sessions!
    
    // MARK: Init
    
    public init(apiToken: String,
                providerId: String,
                apiVersion: ApiConfig.Version = .current) {
        self.config = Config(providerId: providerId,
                             apiVersion: apiVersion)
        initComponents(with: config)
        initAuthControllers(with: config,
                            requestBuilder: requestBuilder,
                            executor: requestExecutor,
                            apiToken: apiToken)
        initControllers(with: config,
                        requestBuilder: requestBuilder,
                        executor: requestExecutor)
    }
    
    private func initComponents(with config: Config) {
        
        self.requestBuilder = RequestBuilder(with: config,
                                             urlBuilder: UrlBuilder(with: config))
        self.requestExecutor = RequestExecutor()
    }
    
    private func initAuthControllers(with config: Config,
                                     requestBuilder: RequestBuilder,
                                     executor: RequestExecutor,
                                     apiToken: String) {
        let authController = AuthenticationController(with: config,
                                                      requestBuilder: requestBuilder,
                                                      executor: requestExecutor,
                                                      apiToken: apiToken)
        requestBuilder.authProvider = authController
        executor.authResponder = authController
        self.auth = authController
    }
    
    private func initControllers(with config: Config,
                                 requestBuilder: RequestBuilder,
                                 executor: RequestExecutor) {
        let sessionsController = SessionsController(with: config,
                                                    requestBuilder: requestBuilder,
                                                    executor: executor)
        self.sessions = sessionsController   
    }
}
