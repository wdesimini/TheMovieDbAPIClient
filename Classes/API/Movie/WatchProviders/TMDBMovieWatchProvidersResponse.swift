//
//  TMDBMovieWatchProvidersResponse.swift
//  TheMovieDbAPIClient
//
//  Created by Wilson Desimini on 9/29/21.
//

import Foundation

public struct TMDBMovieWatchProvidersResponse: Codable {
    public let id: Int
    public let results: TMDBMovieWatchProvidersResultByCountry?

    enum CodingKeys: String, CodingKey {
        case id
        case results
    }
}

public extension TMDBMovieWatchProvidersResponse {
    struct TMDBMovieWatchProvidersResultByCountry: Codable {
        public let ar: TMDBMovieWatchProvidersResult?
        public let at: TMDBMovieWatchProvidersResult?
        public let au: TMDBMovieWatchProvidersResult?
        public let be: TMDBMovieWatchProvidersResult?
        public let br: TMDBMovieWatchProvidersResult?
        public let ca: TMDBMovieWatchProvidersResult?
        public let ch: TMDBMovieWatchProvidersResult?
        public let cl: TMDBMovieWatchProvidersResult?
        public let co: TMDBMovieWatchProvidersResult?
        public let cz: TMDBMovieWatchProvidersResult?
        public let de: TMDBMovieWatchProvidersResult?
        public let dk: TMDBMovieWatchProvidersResult?
        public let ec: TMDBMovieWatchProvidersResult?
        public let ee: TMDBMovieWatchProvidersResult?
        public let es: TMDBMovieWatchProvidersResult?
        public let fi: TMDBMovieWatchProvidersResult?
        public let fr: TMDBMovieWatchProvidersResult?
        public let gb: TMDBMovieWatchProvidersResult?
        public let gr: TMDBMovieWatchProvidersResult?
        public let hu: TMDBMovieWatchProvidersResult?
        public let id: TMDBMovieWatchProvidersResult?
        public let ie: TMDBMovieWatchProvidersResult?
        public let it: TMDBMovieWatchProvidersResult?
        public let jp: TMDBMovieWatchProvidersResult?
        public let kr: TMDBMovieWatchProvidersResult?
        public let lt: TMDBMovieWatchProvidersResult?
        public let lv: TMDBMovieWatchProvidersResult?
        public let mx: TMDBMovieWatchProvidersResult?
        public let my: TMDBMovieWatchProvidersResult?
        public let nl: TMDBMovieWatchProvidersResult?
        public let no: TMDBMovieWatchProvidersResult?
        public let nz: TMDBMovieWatchProvidersResult?
        public let pe: TMDBMovieWatchProvidersResult?
        public let ph: TMDBMovieWatchProvidersResult?
        public let pl: TMDBMovieWatchProvidersResult?
        public let pt: TMDBMovieWatchProvidersResult?
        public let ro: TMDBMovieWatchProvidersResult?
        public let ru: TMDBMovieWatchProvidersResult?
        public let se: TMDBMovieWatchProvidersResult?
        public let sg: TMDBMovieWatchProvidersResult?
        public let th: TMDBMovieWatchProvidersResult?
        public let tr: TMDBMovieWatchProvidersResult?
        public let us: TMDBMovieWatchProvidersResult?
        public let ve: TMDBMovieWatchProvidersResult?
        public let za: TMDBMovieWatchProvidersResult?
        
        enum CodingKeys: String, CodingKey {
            case ar = "AR"
            case at = "AT"
            case au = "AU"
            case be = "BE"
            case br = "BR"
            case ca = "CA"
            case ch = "CH"
            case cl = "CL"
            case co = "CO"
            case cz = "CZ"
            case de = "DE"
            case dk = "DK"
            case ec = "EC"
            case ee = "EE"
            case es = "ES"
            case fi = "FI"
            case fr = "FR"
            case gb = "GB"
            case gr = "GR"
            case hu = "HU"
            case id = "ID"
            case ie = "IE"
            case it = "IT"
            case jp = "JP"
            case kr = "KR"
            case lt = "LT"
            case lv = "LV"
            case mx = "MX"
            case my = "MY"
            case nl = "NL"
            case no = "NO"
            case nz = "NZ"
            case pe = "PE"
            case ph = "PH"
            case pl = "PL"
            case pt = "PT"
            case ro = "RO"
            case ru = "RU"
            case se = "SE"
            case sg = "SG"
            case th = "TH"
            case tr = "TR"
            case us = "US"
            case ve = "VE"
            case za = "ZA"
        }
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            ar = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ar)
            at = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .at)
            au = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .au)
            be = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .be)
            br = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .br)
            ca = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ca)
            ch = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ch)
            cl = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .cl)
            co = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .co)
            cz = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .cz)
            de = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .de)
            dk = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .dk)
            ec = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ec)
            ee = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ee)
            es = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .es)
            fi = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .fi)
            fr = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .fr)
            gb = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .gb)
            gr = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .gr)
            hu = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .hu)
            id = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .id)
            ie = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ie)
            it = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .it)
            jp = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .jp)
            kr = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .kr)
            lt = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .lt)
            lv = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .lv)
            mx = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .mx)
            my = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .my)
            nl = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .nl)
            no = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .no)
            nz = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .nz)
            pe = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .pe)
            ph = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ph)
            pl = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .pl)
            pt = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .pt)
            ro = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ro)
            ru = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ru)
            se = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .se)
            sg = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .sg)
            th = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .th)
            tr = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .tr)
            us = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .us)
            ve = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .ve)
            za = try values.decodeIfPresent(TMDBMovieWatchProvidersResult.self, forKey: .za)
        }
    }
    
    struct TMDBMovieWatchProvidersResult: Codable {
        public let buy: [TMDBProvider]?
        public let flatrate: [TMDBProvider]?
        public let link: String
        public let rent: [TMDBProvider]?
        
        enum CodingKeys: String, CodingKey {
            case buy
            case flatrate
            case link
            case rent
        }
    }
}

public extension TMDBMovieWatchProvidersResponse.TMDBMovieWatchProvidersResult {
    struct TMDBProvider: Codable {
        public let displayPriority: Int
        public let logoPath: String
        public let providerId: Int
        public let providerName: String

        enum CodingKeys: String, CodingKey {
            case displayPriority
            case logoPath
            case providerId
            case providerName
        }
    }
}
