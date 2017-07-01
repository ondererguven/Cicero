//
//  ArtPieceCollection.swift
//  Cicero
//
//  Created by Luca Carmisciano on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import Foundation

class Collection {
    
    static let of = Collection()
    
    let artPiece: [CollectionType : [ArtPiece]]!
    
    init() {
        
        artPiece = [:]
        
        // sample data
        artPiece[.appartamentiReali] = [
            ArtPiece(image: #imageLiteral(resourceName: "Stanza 45 - Corridoi"), imageContainer: .start, title: "Corridoio", descr: "Stanza 45", voiceOver: "Ti trovi in uno dei corridoi degli appartamenti reali. In questa sala puoi trovare alla tua destra ed alla tua sinistra la mobilia risalente all’800 che è possibile toccare. Mentre continuando il percorso raggiungerai la sala delle porcellane."),
            ArtPiece(image: #imageLiteral(resourceName: "porcellana"), imageContainer: .middle, title: "Stanza di Porcellana", descr: "Stanza 52", voiceOver: "Ti trovi nel salottino di porcellana negli Appartamenti Reali. L’ambiente, fastosamente decorato a cineserie, è a pianta quadrangolare con pareti interamente rivestite di lastre di porcellana, fissate a un telaio ligneo, interrotte da sei grandi specchiere, e completata da un soffitto in stucco ad imitazione della porcellana. La decorazione si compone di rami, foglie, frutti e fiori, trofei musicali e scimmie intervallati da piccole e grandi specchiature con scene di vita cinese. Arricchisce il salottino il lampadario a dodici bracci che raffigura un giovane cinese dall’aria malinconica e ammiccante che pungola un drago con il suo ventaglio."),
            ArtPiece(image: #imageLiteral(resourceName: "mobili"), imageContainer: .ending, title: "Appartamenti", descr: "Stanza 60", voiceOver: "Ti trovi in uno degli appartamenti reali. La sala è completamente fruibile. E’ possibile toccare gli antichi arazzi lungo tutto il perimetro. La sala è circolata da opere e strutture in marmo. Se continui lungo il percorso arriverai ad una delle uscite per i giardini.")
        ]
        
        artPiece[.armeria] = [
            ArtPiece(image: #imageLiteral(resourceName: "armatura"), imageContainer: .start, title: "Rotella", descr: "Stanza 48", voiceOver: "Ti trovi nella stanza dedicata alle armi bianche. Le armi bianche, le spade e le daghe provengono invece dalla Real Fabbrica o dalla Fabbrica degli Acciai. Alla tua destra e’ possibile apprezzare con il tatto le rifiniture della rotella. La rotella è una sorta di scudo di forma circolare che presenta una sporgenza nella parte centrale, per meglio respingere le frecce durante le battaglie. L'esemplare, qui conservato, è decorato con scene tratte dalla storia di Roma ed in particolare l'avvenimento in cui Orazio Coclite difende il ponte sul fiume Tevere. Arrivato in questa stanza puoi andare dritto per continuare il tuo tragitto nelle Armerie."),
            ArtPiece(image: #imageLiteral(resourceName: "armatura"), imageContainer: .middle, title: "Armature", descr: "Stanza 49", voiceOver: "Ti trovi nella stanza dell’Armeria dedicata alle Armature. Alla tua destra ed alla tua sinistra troverai delle teche in cui sono conservate le reali armature prodotte dai maestri milanesi del 600. Purtroppo non è possibile toccare nulla in questa sala, ma puoi continuare dritto per arrivare nella sala dell’Armeria dedicata alla Cavalleria."),
            ArtPiece(image: #imageLiteral(resourceName: "statue"), imageContainer: .ending, title: "Cavalleria", descr: "Stanza 50", voiceOver: "Ti trovi nella sala più grande dell’armeria, dedicata alle armature ed in particolare alla cavalleria. Alla tua destra ed alla tua sinistra trovi le teche contenenti le armi da fuoco. Al centro della sala è presente una copia, a grandezza naturale, di un cavalleggero. E’ possibile toccare il cavallo e i relativi riferimenti e sporgendosi anche parte dell’armatura del cavalleggero. ")
        ]
        
        artPiece[.giardini] = [
            ArtPiece(image: #imageLiteral(resourceName: "scale"), imageContainer: .start, title: "Uscita", descr: "G1", voiceOver: "Ti trovi all’uscita secondaria del Museo del Bosco di Capodimonte. Continuando a camminare potrai incontrare il prossimo suggerimento che ti porterà alla scoperta del Bosco."),
            ArtPiece(image: #imageLiteral(resourceName: "inizio"), imageContainer: .middle, title: "Inizio Percorso", descr: "G2", voiceOver: "Ti trovi all’inizio del percorso reale del Bosco di Capodimonte. Ai lati del percorso è possibile riposarsi sulle panchine, mentre continuando lungo il percorso ti inoltrerai nella natura incontaminata."),
            ArtPiece(image: #imageLiteral(resourceName: "giardino"), imageContainer: .ending, title: "Giardino", descr: "G3", voiceOver: "Ti sei appena inoltrato nel percorso guidato lungo il giardino del Bosco. Le numerose palme che si ergono davanti Porta grande e intorno al Palazzo reale, sono state impiantate dal tardo Ottocento e in particolare quando i Duchi d’Aosta abitarono stabilmente nella Reggia. A quel tempo le praterie erano ancora impreziosite da bordure di fiori e da specie diverse di rose, spesso sistemate in circolo intorno alle palme. Attualmente si osservano molti esemplari di Palma delle Canarie e Washingtonia, gruppi di Phoenix reclinata e di Palme nane e solo sporadici o singoli esemplari di Cycas revoluta, Butia capitata e Livinstona chinensis. A mezzogiorno della Reggia, dove s’innalza la Fontana del belvedere, si estende l’ampia radura che era nota come la “Veduta di Napoli”, in quanto la vista panoramica abbraccia il colle di San Martino ed il golfo fino a Punta Campanella e a Capri. La prateria ad ovest della Reggia, oggi interamente racchiusa dalla macchia a bosco, si apriva in alcuni punti sul paesaggio ed era conosciuta come la “Veduta di villa Ruffo”.")
        ]
        
    }
    
    
}
