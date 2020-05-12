extern crate phase2;
extern crate exitcode;

use std::io;
use std::fs::OpenOptions;
use phase2::parameters::MPCParameters;
use phase2::keypair::PublicKey;
use phase2::hash_writer::HashWriter;

fn get_hash(pubkey: &PublicKey) -> [u8; 64] {
    // Calculate the hash of the public key and return it
    let sink = io::sink();
    let mut sink = HashWriter::new(sink);
    pubkey.write(&mut sink).unwrap();
    let h = sink.into_hash();
    let mut response = [0u8; 64];
    response.copy_from_slice(h.as_ref());
    response
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 2 {
        println!("Usage: \n<params>");
        std::process::exit(exitcode::USAGE);
    }
    let params_filename = &args[1];

    let disallow_points_at_infinity = false;

    let reader = OpenOptions::new()
        .read(true)
        .open(params_filename)
        .expect("unable to open.");
    let params = MPCParameters::read(reader, disallow_points_at_infinity, true).expect("unable to read params");
    println!("CS hash: 0x{}", hex::encode(params.cs_hash.to_vec()));
    for i in 0..params.contributions.len() {
        println!("Contribution {} hash: 0x{}", i + 1, hex::encode(get_hash(&params.contributions[i]).to_vec()));
    }
}
