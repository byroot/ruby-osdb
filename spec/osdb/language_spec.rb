require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OSDb::Language do
  
  describe '.from_locale' do
    
    describe "simple locale" do
      
      subject{ OSDb::Language.from_locale('fr') }
      
      its(:name) { should == 'French' }
      
      its(:to_iso639_1) { should == 'fr' }
      
      its(:to_iso639_2b) { should == 'fre' }
      
    end
    
    describe "locale with territory" do
      
      subject{ OSDb::Language.from_locale('en_US') }
      
      its(:name) { should == 'English (US)' }
      
      its(:to_iso639_1) { should == 'en' }
      
      its(:to_iso639_2b) { should == 'eng' }
      
    end

    describe "locale with territory and encoding" do
      
      subject{ OSDb::Language.from_locale('es_ES.UTF8') }
      
      its(:name) { should == 'Spanish (Spain)' }
      
      its(:to_iso639_1) { should == 'es' }
      
      its(:to_iso639_2b) { should == 'spa' }
      
    end
    
  end
  
  describe ".from_iso_639_2b" do
    
    subject{ OSDb::Language.from_iso639_2b('bre') }
    
    its(:name) { should == 'English (UK)' }
    
    its(:to_iso639_1) { should == 'en' }
    
    its(:to_locale) { should == 'en_GB' }
    
  end
  
end
