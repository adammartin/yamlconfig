require 'config_loader'
require 'spec_helper'

describe ConfigLoader do
  before (:each) do
    give(File).read(full_file) {
      yaml
    }
    give(File).read(full_file_default) {
      yaml_default
    }
    give(File).exist?(full_file) {
      file_existance
    }
    give(File).exist?(full_file_default) {
      file_default_existance
    }
  end

  let(:file) {
    "config.yaml"
  }

  let(:file_default) {
    "config_default.yaml"
  }

  let(:full_file) {
    File.join root_dir, file
  }

  let(:full_file_default) {
    File.join root_dir, file_default
  }

  let(:root_dir) {
    "application_root_dir"
  }

  let (:loader) {
    ConfigLoader.new root_dir
  }

  let(:base_working_dir_key) {
    "base_working_dir"
  }

  context "a file exists" do
    let(:file_existance) {
      true
    }
    let(:file_default_existance) {
      true
    }

    context "file with contents" do
      let (:yaml) {
        "a: b"
      }
      let (:yaml_default) {
        "c: d"
      }

      it "loads the default file" do
        loader.parse file
        verify(File).read full_file_default
      end

      it "loads the user file" do
        loader.parse file
        verify(File).read full_file
      end

      it "loads a file with root_dir appended" do
        resp = loader.parse file
        expect(resp).to eq "a" => "b", "c" => "d", base_working_dir_key => root_dir
      end
    end

    context "empty file" do
      let (:yaml) {
        ""
      }
      let (:yaml_default) {
        ""
      }
      it "should be empty" do
        resp = loader.parse file
        expect(resp).to eq Hash.new
      end
    end

    context "default file and file have same key" do
      let (:yaml) {
        "a: b"
      }
      let (:yaml_default) {
        "a: d"
      }
      it "prefer file" do
        resp = loader.parse file
        expect(resp).to eq "a" => "b", base_working_dir_key => root_dir
      end
    end
  end

  context "no file exists" do
    let(:file_existance) {
      false
    }
    let(:file_default_existance) {
      false
    }

    it "should be an empty result" do
      resp = loader.parse file
      expect(resp).to eq Hash.new
    end
  end

end
