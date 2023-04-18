# Goodnight App
An app that would track a user's sleep and wakeup time


### Installation
In your terminal, clone the repo
```sh
    $ git clone git@github.com:vinieshwan/goodnight-app.git
```

Install dependencies, prepare database, populate users and run rails server
```sh
    $ ./bin/setup
```
Note: _This is developed and tested under Ruby 3.2.2_

### API Endpoints
- <a href="#profile-bedtime-logs">Profile bedtime logs</a>
- <a href="#profile-followed-users">Profile followed users</a>
- <a href="#followed-users-bedtime-logs">Followed users bedtime logs</a>
- <a href="#follow-user">Follow user</a>
- <a href="#unfollow-user">Unfollow user</a>
- <a href="#log-sleep-time">Log sleep time</a>
- <a href="#log-wakeup-time">Log wakeup time</a>


#### Profile bedtime logs
Display the user's bedtime logs

<table>
    <tr>
        <th>Request Sample</th>
    </tr>
    <tr>
        <td><code>[GET]</code> /profile/bedtime_logs</td>
    </tr>
    <tr>
        <td>CURL</td>
    </tr>
    <tr>
        <td>
            <pre>
curl -L \
-H "Accept: application/json" \
-H "Authorization: Basic &lt;USER-API-KEY&gt;"\
http://localhost:&lt;PORT&gt;/profile/bedtime_logs</pre>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>Response status codes and schema</th>
    </tr>
    <tr>
        <td>
            Status Codes<br />
            ____________________________________________<br /><br />
            <code>200</code> - OK<br />
            <code>404</code> - Not Found<br />
            <code>401</code> - Unauthorized<br />
        </td>
    </tr>
    <tr>
        <td>
            Response schema<br />
            <pre>
{
  "type": "object",
  "properties": {
    "data": {
      "type": "object",
      "properties": {
        "type": {
         "type": "string"
        },
        "attributes": {
          "type": "object",
          "properties": {
            "users": {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  "id": {
                    "type": "integer"
                  },
                  "name": {
                    "type": "string"
                  }
                  "logs": {
                    "type": "array",
                    "items": {
                      "type": "object",
                      "properties": {
                        "clock_in": {
                          "type": "string",
                          "format": "datetime"
                        },
                        "clock_out": {
                          "type": "string",
                          "format": "datetime"
                        },
                        "duration": {
                          "type": "integer"
                        },
                        "created_at": {
                          "type": "string",
                          "format": "datetime"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}</pre>
        </td>
    </tr>
</table>

#### Profile followed users
Display the user's followed users

<table>
    <tr>
        <th>Request Sample</th>
    </tr>
    <tr>
        <td><code>[GET]</code> /profile/following</td>
    </tr>
    <tr>
        <td>CURL</td>
    </tr>
    <tr>
        <td>
            <pre>
curl -L \
-H "Accept: application/json" \
-H "Authorization: Basic &lt;USER-API-KEY&gt;"\
http://localhost:&lt;PORT&gt;/profile/following</pre>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>Response status codes and schema</th>
    </tr>
    <tr>
        <td>
            Status Codes<br />
            ____________________________________________<br /><br />
            <code>200</code> - OK<br />
            <code>404</code> - Not Found<br />
            <code>401</code> - Unauthorized<br />
        </td>
    </tr>
    <tr>
        <td>
            Response schema<br />
            <pre>
{
  "type": "object",
  "properties": {
    "data": {
      "type": "object",
      "properties": {
        "type": {
         "type": "string"
        },
        "attributes": {
          "type": "object",
          "properties": {
            "users": {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  "id": {
                    "type": "integer"
                  },
                  "name": {
                    "type": "string"
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}</pre>
        </td>
    </tr>
</table>

#### Followed users bedtime logs
Display the bedtime logs of all followed users

<table>
    <tr>
        <th>Request Sample</th>
    </tr>
    <tr>
        <td><code>[GET]</code> /users/bedtime_logs</td>
    </tr>
    <tr>
        <td>CURL</td>
    </tr>
    <tr>
        <td>
            <pre>
curl -L \
-H "Accept: application/json" \
-H "Authorization: Basic &lt;USER-API-KEY&gt;"\
http://localhost:&lt;PORT&gt;/users/bedtime_logs</pre>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>Response status codes and schema</th>
    </tr>
    <tr>
        <td>
            Status Codes<br />
            ____________________________________________<br /><br />
            <code>200</code> - OK<br />
            <code>404</code> - Not Found<br />
            <code>401</code> - Unauthorized<br />
        </td>
    </tr>
    <tr>
        <td>
            Response schema<br />
            <pre>
{
  "type": "object",
  "properties": {
    "data": {
      "type": "object",
      "properties": {
        "type": {
         "type": "string"
        },
        "attributes": {
          "type": "object",
          "properties": {
            "users": {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  "id": {
                    "type": "integer"
                  },
                  "name": {
                    "type": "string"
                  }
                  "logs": {
                    "type": "array",
                    "items": {
                      "type": "object",
                      "properties": {
                        "clock_in": {
                          "type": "string",
                          "format": "datetime"
                        },
                        "clock_out": {
                          "type": "string",
                          "format": "datetime"
                        },
                        "duration": {
                          "type": "integer"
                        },
                        "created_at": {
                          "type": "string",
                          "format": "datetime"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}</pre>
        </td>
    </tr>
</table>


#### Follow user
Follow a user

<table>
    <tr>
        <th>Request Sample</th>
    </tr>
    <tr>
        <td><code>[POST]</code> /users/:id/follow</td>
    </tr>
    <tr>
        <td>CURL</td>
    </tr>
    <tr>
        <td>
            <pre>
curl -L \
-H "Accept: application/json" \
-X POST \
-H "Authorization: Basic &lt;USER-API-KEY&gt;"\
http://localhost:&lt;PORT&gt;/users/:&lt;ID&gt;/follow</pre>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>Response status codes and schema</th>
    </tr>
    <tr>
        <td>
            Status Codes<br />
            ____________________________________________<br /><br />
            <code>204</code> - No content<br />
            <code>304</code> - Not modified<br />
            <code>404</code> - Not found<br />
            <code>401</code> - Unauthorized<br />
        </td>
    </tr>
    <tr>
        <td>
            No response content
        </td>
    </tr>
</table>

#### Unfollow user
Unfollow a user

<table>
    <tr>
        <th>Request Sample</th>
    </tr>
    <tr>
        <td><code>[POST]</code> /users/:id/unfollow</td>
    </tr>
    <tr>
        <td>CURL</td>
    </tr>
    <tr>
        <td>
            <pre>
curl -L \
-H "Accept: application/json" \
-X POST \
-H "Authorization: Basic &lt;USER-API-KEY&gt;"\
http://localhost:&lt;PORT&gt;/users/:&lt;ID&gt;/unfollow</pre>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>Response status codes and schema</th>
    </tr>
    <tr>
        <td>
            Status Codes<br />
            ____________________________________________<br /><br />
            <code>204</code> - No content<br />
            <code>304</code> - Not modified<br />
            <code>404</code> - Not found<br />
            <code>401</code> - Unauthorized<br />
        </td>
    </tr>
    <tr>
        <td>
            No response content
        </td>
    </tr>
</table>

#### Log sleep time
Clock in when logging the sleep time

<table>
    <tr>
        <th>Request Sample</th>
    </tr>
    <tr>
        <td><code>[POST]</code> /bedtime/in</td>
    </tr>
    <tr>
        <td>CURL</td>
    </tr>
    <tr>
        <td>
            <pre>
curl -L \
-H "Accept: application/json" \
-X POST \
-H "Authorization: Basic &lt;USER-API-KEY&gt;"\
http://localhost:&lt;PORT&gt;/bedtime/in</pre>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>Response status codes and schema</th>
    </tr>
    <tr>
        <td>
            Status Codes<br />
            ____________________________________________<br /><br />
            <code>201</code> - Created<br />
            <code>404</code> - Not Found<br />
            <code>401</code> - Unauthorized<br />
        </td>
    </tr>
    <tr>
        <td>
            Response schema<br />
            <pre>
{
  "type": "object",
  "properties": {
    "data": {
      "type": "object",
      "properties": {
        "type": {
         "type": "string"
        },
        "attributes": {
          "type": "object",
          "properties": {
            "users": {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  "id": {
                    "type": "integer"
                  },
                  "name": {
                    "type": "string"
                  }
                  "logs": {
                    "type": "array",
                    "items": {
                      "type": "object",
                      "properties": {
                        "clock_in": {
                          "type": "string",
                          "format": "datetime"
                        },
                        "clock_out": {
                          "type": "string",
                          "format": "datetime"
                        },
                        "duration": {
                          "type": "integer"
                        },
                        "created_at": {
                          "type": "string",
                          "format": "datetime"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}</pre>
        </td>
    </tr>
</table>

#### Log wakeup time
Clock out when logging the wake up time

<table>
    <tr>
        <th>Request Sample</th>
    </tr>
    <tr>
        <td><code>[POST]</code> /bedtime/out</td>
    </tr>
    <tr>
        <td>CURL</td>
    </tr>
    <tr>
        <td>
            <pre>
curl -L \
-H "Accept: application/json" \
-X POST \
-H "Authorization: Basic &lt;USER-API-KEY&gt;"\
http://localhost:&lt;PORT&gt;/bedtime/out</pre>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>Response status codes and schema</th>
    </tr>
    <tr>
        <td>
            Status Codes<br />
            ____________________________________________<br /><br />
            <code>200</code> - OK<br />
            <code>404</code> - Not Found<br />
            <code>400</code> - Bad request<br />
            <code>401</code> - Unauthorized<br />
        </td>
    </tr>
    <tr>
        <td>
            Response schema<br />
            <pre>
{
  "type": "object",
  "properties": {
    "data": {
      "type": "object",
      "properties": {
        "type": {
         "type": "string"
        },
        "attributes": {
          "type": "object",
          "properties": {
            "users": {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  "id": {
                    "type": "integer"
                  },
                  "name": {
                    "type": "string"
                  }
                  "logs": {
                    "type": "array",
                    "items": {
                      "type": "object",
                      "properties": {
                        "clock_in": {
                          "type": "string",
                          "format": "datetime"
                        },
                        "clock_out": {
                          "type": "string",
                          "format": "datetime"
                        },
                        "duration": {
                          "type": "integer"
                        },
                        "created_at": {
                          "type": "string",
                          "format": "datetime"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}</pre>
        </td>
    </tr>
</table>