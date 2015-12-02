//
//  Document.swift
//  IpfsApp
//
//  Created by Teo on 09/11/15.
//  Copyright © 2015 Teo Sartori. All rights reserved.
//

import Cocoa
import SwiftIpfsApi

class Document: NSDocument {

    @IBOutlet weak var IpfsNodeId: NSTextField!
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override func windowControllerDidLoadNib(aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
        do {
            let api = try IpfsApi(host: "127.0.0.1", port: 5001)
            
            try api.id() {
                (idData : JsonType) in
                
                let winName = idData.object?["ID"]?.string
                
                self.IpfsNodeId.stringValue = winName!
            }
            
        } catch {
            print("There was an error initializing the IPFS api client: \(error)")
        }

    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override var windowNibName: String? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return "Document"
    }

    override func dataOfType(typeName: String) throws -> NSData {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func readFromData(data: NSData, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

