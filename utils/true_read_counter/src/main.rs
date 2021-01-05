use seq_io::prelude::*;  // needed to import necessary traits
use seq_io::fastq::{Reader};
use std::io;
use std::collections::HashMap;
use fasthash::RandomState;
use std::hash::{Hash, Hasher};
use fasthash::{sea, SeaHasher};



fn main() {

let mut reader = Reader::new(io::stdin());
let mut stdout = io::stdout();

let s = RandomState::<sea::Hash64>::new();
let mut counts = HashMap::with_hasher(s);

while let Some(result) = reader.next() {
    let rec = result.expect("reading error");
    let id = rec.id().unwrap();
    let tid = id.split(";").next().unwrap().split("/").nth(1).unwrap().to_string();
    *counts.entry(tid).or_insert(0) += 1;
}


println!("tname\ttrue_count");
// Iterate over everything.
for (tn, c) in &counts{
    println!("{}\t{}", tn, c);
}

}
