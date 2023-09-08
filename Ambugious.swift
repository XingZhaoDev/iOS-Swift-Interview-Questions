public enum ReplicationStatus: String {
    case stopped
    case offline
    case connecting
    case idle
    case unknown
}

struct Relicator {

}

protocol MyCouchbaseStack: AnyObject, CustomStringConvertible {
    var bucketName: String { get }
    var databaseName: String { get }
    var isContinuous: Bool { get }
    var replicator: Relicator? { get }
}

class CouchbaseKit: MyCouchbaseStack {
     var bucketName: String
     let databaseName: String
     var isContinuous: Bool
     var replicator: Relicator?

     public init(bucketName: String,
                 databaseName: String,
                 isContinuous: Bool) {
        self.bucketName = bucketName
        self.databaseName = databaseName
        self.isContinuous = isContinuous
    }
}

extension MyCouchbaseStack {
    var description: String {
        return databaseName
    }
}

extension MyCouchbaseStack {
    func configureReplication(sessionKey: String?, bearerToken: String?) {
        
    }
}