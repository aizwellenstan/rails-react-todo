class AuthController < ApplicationController
    def login
        user = User.find_by(username: params[:Username])
        if user
            is_authenticated = user.authenticate(params[:Password])

            if is_authenticated
                payload =  user_payload(user)

                render json: { 
                    # "AccountInfo": {
                        # "CompanyId": user.companyId,
                        # "ProductId": user.productId,
                        # "ProjectId": user.projectId,
                        # "AccountId": user.username,
                        # "Password": user.password_digest,
                        # "Description": user.description,
                        # "Group": user.group,
                        # "LicenseId": user.licenseId,
                        # "ExpiryDate": user.expiryDate,
                        # "belongs": user.belongs,
                        # "SiUsername": user.SiUsername,
                        # "UserId": user.id,
                        # "UserInfo": [
                        # {
                        #     "Key": "Address",
                        #     "Language": user.language,
                        #     "Value": user.address
                        # },
                        # {
                        #     "Key": "PhoneNumber",
                        #     "Language": user.language,
                        #     "Value": user.phone
                        # },
                        # {
                        #     "Key": "e-mail",
                        #     "Language": user.language,
                        #     "Value": user.email
                        # }
                        # ],
                        "message": "Login Success",
                        "code": "200",
                        token: encode_token(user_payload(user)) 
                    # }
                }, :status => :ok
            else
                render json: { message: "Wrong password.", code: 401}, :status => :unauthorized
            end
        else
            render json: { message: "Wrong username.", code: 401} , :status => :unauthorized
        end
    end
end
