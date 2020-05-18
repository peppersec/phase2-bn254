extern crate phase2;
extern crate exitcode;

use std::fs::File;
use phase2::circom_circuit::{load_params_file, filter_params};

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 3 {
        println!("Usage: \n<in_params.params> <out_params.params>");
        std::process::exit(exitcode::USAGE);
    }
    let in_params = &args[1];
    let out_params = &args[2];
    println!("Exporting {}...", in_params);
    let mut params = load_params_file(in_params);
    filter_params(&mut params);
    let mut writer = File::create(out_params).unwrap();
    params.write(&mut writer).unwrap();
    println!("Created {}.", out_params);
}
