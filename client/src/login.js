import React from 'react';


export class Login extends React.Component {
    constructor() {
        super();
        this.doLogin = this.doLogin.bind(this);
    }

    doLogin() {
        const userName = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        if (userName !== '' && password !== '') {


            const uri = 'http://127.0.0.1:3000/login'
            fetch(uri, {
                method: 'post',
                headers: {
                    'Content-Type': 'application/json',
                    Accept: 'application/json'
                },
                body: JSON.stringify({
                    'Username': userName,
                    'Password': password
                })
            })
                .then(
                    response =>
                        response.json().then(data => ({
                            data: data,
                            status: response.status
                        }))
                )
                .then(res => {
                    if (res.status === 401) {
                        alert('ユーザ名かパスワードが間違っています');
                    } else {
                        if (res.data.token) {
                            localStorage.setItem('token', res.data.token)
                        }
                        setTimeout(() => {
                            this.props.doLogin(userName);
                            window.location.reload();
                        }, 1000)
                    }
                })

        } else {
            alert('ユーザーネームとパスワードを入力してください');
        }

    }

    render() {
        return (
            <div className="content">
                <div className="img">
                    <a href="#" className="logo" alt="todo" title="todo" />
                </div>
                <div className="login type1">
                    <div className="input-wrapper">
                        <i className="icon username" />
                        <input className="textbox" type="text" name="username" id="username" placeholder="username or email" />
                    </div>
                    <div className="input-wrapper">
                        <i className="icon password" />
                        <input className="textbox" type="text" name="password" id="password" placeholder="password" />
                    </div>
                </div>
                <div className="login-options">
                    <button type="button" className="login-btn" onClick={this.doLogin}>LOGIN</button>
                </div>
            </div>
        )
    }
}
