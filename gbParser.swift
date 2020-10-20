//
//  File.swift
//  
//
//  Created by Ashwin on 2020-10-18.
//

import Foundation


//Function to parse source organism which will be in the first capture group
func gbSource(text:String) -> [String] {
    //regex to find the source organism of the genbank file
    let seqFind = try? NSRegularExpression(pattern: "organism=\"(.)+\""
    //use your regex to search the string of the genbank file downloaded in downloadfile.swift
    let results = seqFind!.matches(in: downloadfile.filecontents.file, range: NSRange(text.startIndex...,in:text))
    //return the found section
    return results.map {
        String(text[Range($0.range, in: text)!])
    }


//Function to parse translated sequence ID which will be in the first capture group
func gbCDSID(text:String) -> [String] {
    //regex to find the protein ID of the translated sequence of the genbank file. Will only find the first one
    let seqFind = try? NSRegularExpression(pattern: "protein_id=\"(.)+\"")
    //use your regex to search the string of the genbank file downloaded in downloadfile.swift
    let results = seqFind!.first(in: downloadfile.filecontents.file, range: NSRange(text.startIndex...,in:text))
    //return the found section
    return results.map {
    String(text[Range($0.range, in: text)!])
        }


//Function to parse translated sequence which will be in the first capture group
func gbCDS(text:String) -> [String] {
    //regex to find the translated sequence section of the genbank file, only the first one
    let seqFind = try? NSRegularExpression(pattern:"translation=\"([A-Z\n]+)+\"")
    //use your regex to search the string of the genbank file downloaded in downloadfile.swift
    let results = seqFind!.first(in: downloadfile.filecontents.file, range: NSRange(text.startIndex...,in:text))
    //return the found section
    return results.map {
    String(text[Range($0.range, in: text)!])
            
//Function to find the gene features
//Regex for gene and corresponding translated sequence for gene. I'm not sure if we are planning to map all of them,
//or give options for which one gene. The function can be a for loop that parses the gene ID and sequence
//Below is the regex for it, will figure out the coding once we know what we're doing with it.

//gene
//"gene=\"(.)+\""
//Translated sequence
//"translation=\"([A-Z\n]+)+\""



