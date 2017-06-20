//
//  Sessions.swift
//  TeamupKit
//
//  Created by Merrick Sapsford on 19/06/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import Foundation

public protocol Sessions: class {
    
    // MARK: Properties
    
    var registrations: Registrations { get }
    
    // MARK: Methods
    
    /// Load sessions at the current business.
    ///
    /// - Parameters:
    ///   - startDate: The date to show sessions from.
    ///   - endDate: The date to show sessions until.
    ///   - success: Closure to execute on successful request.
    ///   - failure: Closure to execute of failed request.
    func load(between startDate: Date,
              and endDate: Date,
              success: ((ResultsPage<Session>) -> Void)?,
              failure: Controller.MethodFailure?)
    
    /// Load sessions at the current business.
    ///
    /// - Parameters:
    ///   - startDate: The date to show sessions from.
    ///   - endDate: The date to show sessions until.
    ///   - includeRegistrationDetails: Whether to include registration details.
    ///   - includeNonActive: Whether to include non-active sessions.
    ///   - page: The page index to load.
    ///   - success: Closure to execute on successful request.
    ///   - failure: Closure to execute of failed request.
    func load(between startDate: Date,
              and endDate: Date,
              includeRegistrationDetails: Bool,
              includeNonActive: Bool,
              page: Int?,
              success: ((ResultsPage<Session>) -> Void)?,
              failure: Controller.MethodFailure?)
    
    /// Load an individual session details.
    ///
    /// - Parameters:
    ///   - id: The identifier of the session.
    ///   - includeRegistrationDetails: Whether to include registration details.
    ///   - success: Closure to execute on successful request.
    ///   - failure: Closure to execute of failed request.
    func load(sessionWithId id: Int,
              includeRegistrationDetails: Bool,
              success: ((Session) -> Void)?,
              failure: Controller.MethodFailure?)
    
    /// Load the waitlist for a session.
    ///
    /// - Parameters:
    ///   - session: The session to load the waitlist for.
    ///   - success: Closure to execute on successful request.
    ///   - failure: Closure to execute of failed request.
    func loadWaitlist(forSession session: Session,
                      success: ((Session.Waitlist) -> Void)?,
                      failure: Controller.MethodFailure?)
}
