class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode payload, 'wtf', 'HS256'
    end

    def user_payload(user)
        { user_id: user.id }
    end

    def secret
        'wtf'
    end

    def token
        request.headers["token"]
    end

    def decoded_token
        JWT.decode token, secret, true, { algorithm: 'HS256' }
    end

    def current_user
        User.find(decoded_token[0]["user_id"])        
    end

    #License
    require 'openssl'
    require 'date'
    
    def encrypt_string(str)
        cipher_salt1 = 'nadi'
        cipher_salt2 = 'wtf'
        cipher = OpenSSL::Cipher.new('AES-128-ECB').encrypt
        cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
        encrypted = cipher.update(str) + cipher.final
        encrypted.unpack('H*')[0].upcase.scan(/..../).join('-')
    end
    
    def decrypt_string(encrypted_str)
        cipher_salt1 = 'nadi'
        cipher_salt2 = 'wtf'
        # encrypted_str = '3B90-B27F-5348-C93B-4D01-0127-8D08-BF2A'
        encrypted_str = encrypted_str.split('-').join
        cipher = OpenSSL::Cipher.new('AES-128-ECB').decrypt
        cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
        decrypted = [encrypted_str].pack('H*').unpack('C*').pack('c*')

        cipher.update(decrypted) + cipher.final
    end

    def validate_expirdate(expirdate)
        now =  DateTime.strptime(Time.now.to_i.to_s,'%s').to_s.slice!(0..9).split('-').join.to_i
        now < expirdate.to_i ? true : false
    end
end
